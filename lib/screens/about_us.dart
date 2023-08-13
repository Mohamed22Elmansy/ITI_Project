import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About_Us extends StatelessWidget {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "About Us",
            style: GoogleFonts.playfairDisplay(
              color: Colors.black,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.grey[400],
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          height: double.infinity,
          child: SingleChildScrollView(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                    text:
                        '''Organizations are constantly striving to attract and retain top talent.
          
          However, many companies struggle with high turnover rates, often stemming from a lack of clarity in learning and development opportunities. When employees feel their professional growth is hindered and there is a lack of partnership between management and the training department, frustration builds up, leading to increased turnover. In this post, we will explore the importance of providing clear professional development plans and demonstrate how online training, coupled with Industrial Training International's expertise, can help alleviate these challenges.
          
          The Cost of High Turnover: High employee turnover is not only disruptive but also comes with significant costs for businesses. Recruiting, onboarding, and training new employees entail considerable expenses, draining valuable resources that could be better allocated elsewhere. By addressing the root causes of turnover, companies can save money and foster a stable and engaged workforce.
          
          The Importance of Professional Development Plans: Professional development plans are vital tools that empower employees to chart their career growth within an organization. They provide a roadmap for skill enhancement, foster a sense of purpose, and align individual goals with organizational objectives. Sadly, the absence of such plans can leave employees feeling stagnant and undervalued, resulting in increased turnover. 
          
          Want to fully understand the skilled labor shortage?
           Check out this free downloadable slide deck: "LABOR SHORTAGE WOES?"
          
          Bridging the Gap with Online Training: Online training has emerged as a powerful solution to bridge the gap between employee development and organizational objectives. It offers flexibility, accessibility, and a wide range of courses tailored to individual needs. With the advent of cutting-edge e-learning platforms, employees can access training modules at their convenience, allowing for continuous learning while accommodating busy work schedules.
          
          The Role of Industrial Training International (ITI): Industrial Training International is a global leader in providing comprehensive training solutions to enhance workforce skills in the industrial sector. ITI's expertise extends across various industries, including construction, manufacturing, energy, and more. By partnering with ITI, organizations gain access to a wealth of industry-specific training programs, ensuring employees receive the most relevant and up-to-date skills and knowledge.
          
          Benefits of Partnering with ITI:
          A. Customized Training Programs: ITI collaborates closely with organizations to develop customized training plans tailored to their unique needs. This personalized approach helps address skill gaps and promotes a culture of continuous learning.
          B. Cutting-Edge Technology: ITI leverages advanced technologies, such as virtual reality simulations and interactive modules, to create immersive learning experiences. This enhances engagement, retention, and knowledge application among employees.
          C. Industry Expertise: With a vast network of subject-matter experts, ITI brings deep industry knowledge to the table. By tapping into their expertise, organizations can ensure that their training programs align with industry best practices and regulatory requirements.
          D. Comprehensive Certification: ITI provides certifications that validate employees' skills and enhance their professional credibility. These certifications serve as valuable credentials that benefit both the employees and the organization.
          To address the pain point of high turnover resulting from a lack of learning and development clarity, companies must invest in providing employees with clear professional development plans. By leveraging online training platforms and partnering with experts like Industrial Training International, organizations can cultivate a culture of continuous learning, boost employee engagement, and reduce turnover rates. With the right training and development strategies in place, companies can unlock their workforce's full potential and drive long-term success. '''),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
