package lk.ijse.srifoodsecommerceweb;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
    private static final HashMap<String, String> verificationCodes = new HashMap<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String code = request.getParameter("code");

        if (email != null && !email.isEmpty()) {
            // Step 1: Generate and send verification code
            String verificationCode = generateCode();
            verificationCodes.put(email, verificationCode); // Store the code for the email

            // Store email in session for verification step
            session.setAttribute("email", email);

            // Simulate sending the code (print to console for testing)
            System.out.println("Verification code sent to " + email + ": " + verificationCode);

            response.getWriter().write("success");
        } else if (code != null && !code.isEmpty()) {
            // Step 2: Verify the code
            String sessionEmail = (String) session.getAttribute("email");

            if (sessionEmail != null) {
                String storedCode = verificationCodes.get(sessionEmail);

                if (storedCode != null && storedCode.equals(code)) {
                    response.sendRedirect("resetPassword.jsp");
                } else {
                    response.sendRedirect("forgetPassword.jsp?error=Invalid Code");
                }
            } else {
                response.sendRedirect("forgetPassword.jsp?error=Session Expired. Please try again.");
            }
        } else {
            response.sendRedirect("forgetPassword.jsp?error=Invalid Input. Please try again.");
        }
    }

    private String generateCode() {
        return String.valueOf(new Random().nextInt(900000) + 100000); // Generate a 6-digit code
    }
}
