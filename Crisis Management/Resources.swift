//
//  resourcesTableViewController.swift
//  resources
//
//  Created by Adarsh Goura on 11/4/22.
//

import UIKit

//struct Resource {
//    var category: String
//    var name: String
//    var contact: String
//    var address: String
//    var city: String
//    var state: String
//    var zip: String
//    var website: String
//    var addInfo: String
//}

/*struct categorySection {
    var categoryType: String
    var resources: [Resource]
}*/

//fileprivate func categoryType()

var myIndex = 0
var count = 0
var counter = 0
var tempArrayLength = 0
class resourcesViewController: UITableViewController {

    var resources = [
        [Resource(category: "Crisis Lines", name: "Child Protective Services", contact: "1-800-252-5400", address: "", city: "", state: "", zip: "", website: "", addInfo: "Texas law says anyone who thinks a child, or person 65 years or older, or an adult with disabilities is being abused, neglected, or exploited must report it to DFPS. A person who reports abuse in good faith is immune from civil or criminal liability"),
        Resource(category: "Crisis Lines", name: "National Suicide Prevention Lifeline", contact: "Call or text 988 or 1-800-273-8255", address: "", city: "", state: "", zip: "", website: "https://suicidepreventionlifeline.org/", addInfo: "24/7 free, confidential support for anyone in distress; Prevention and crisis resources for you or loved ones"),
        Resource(category: "Crisis Lines", name: "Crisis Text Line", contact: "Text ‘HELLO’ to 741741 ", address: "", city: "", state: "", zip: "", website: "", addInfo: ""),
        Resource(category: "Crisis Lines", name: "Suicide Crisis Center of North Texas", contact: "214-828-1000", address: "", city: "", state: "", zip: "", website: "", addInfo: "Suicide and Crisis Hotline; Available 24/7 for anyone in crisis or contemplating suicide; Programs for those who have lost a loved one to suicide (free); Teen Programs (TeenScreen) (free)"),
        Resource(category: "Crisis Lines", name: "Texas Youth and Runaway Hotline", contact: "Hotline: 1-800-989-6884; Texting - 512-872-5777; Chat - texasyouth.org", address: "", city: "", state: "", zip: "", website: "texasyouth.org", addInfo: "Individuals can call, chat or text; Crisis Intervention; Referrals for callers who need shelter, counseling, and transportation home; A confidential message relay service is available to promote communications between runaways and their families"),
        Resource(category: "Crisis Lines", name: "Love is Respect", contact: "Hotline: 1-866-331-9474; Texting - love is to 22522; Chat - loveisrespect.org", address: "", city: "", state: "", zip: "", website: "loveisrespect.org", addInfo: "24 hour web based and telephone helpline from National Domestic Violence Hotline; Created to help teens (ages 13-18) to prevent and end dating abuse"),
        Resource(category: "Crisis Lines", name: "The Trevor Project", contact: "1-866-488-7386", address: "", city: "", state: "", zip: "", website: "thetrevorproject.org", addInfo: "Hotline 24/7; Individuals can call, chat, or text; Crisis Intervention and suicide prevention services for lesbian, gay, bisexual, transgender and questioning (LGBTQ) youth under age 25"),
        Resource(category: "Crisis Lines", name: "Here for Texas", contact: "972-525-8181", address: "", city: "", state: "", zip: "", website: "www.herefortexas.com", addInfo: "Free Service; Connects individuals to a trained mental health navigator who can offer support and information about mental health services in our area; Resources are available for anxiety, depression, bipolar, addictions, and other mental health conditions; Helps with transportation to the mental health facility")],
        [Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Carrollton Springs", contact: "972-544-7980", address: "2225 Parker Road", city: "Carrollton", state: "Texas", zip: "75010", website: "https://carrolltonsprings.com/programs/inpatient-treatment/", addInfo: "Offers telehealth; Focus: Offers inpatient mental health treatment; Cost: Accepts most major insurance plans"),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Carrollton Springs Changes ", contact: "469-850-2040", address: "6870 Lebanon Road, Suite 300", city: "Frisco", state: "Texas", zip: "75034", website: "https://carrolltonsprings.com/locations/frisco-tx/", addInfo: "Offers telehealth; Focus: Offers mental health treatment on an outpatient basis through PHP and IOP; Ages: Serves children and adolescents ages 11-18; Cost: Accepts most major insurance plans"),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Charles E. Seay Behavioral Health Center", contact: "682-549-7934 ", address: "6110 W. Parker Road", city: "Plano", state: "Texas", zip: "75093", website: "www.texashealth.org", addInfo: "8 a.m. to 8 p.m; After hours emergency; Mental Health Facility; Focus: mental health, drug and alcohol issues. Offers inpatient, PHP and IOP; Age: Adolescents 12-17. Adults 18 and older will be referred to the adult unit. Children 11 and under will be referred to Children’s Health; Insurance: Approved provider for most major care insurance plans. Contact to see if they accept your insurance plan."),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Children’s Health (formerly Children’s Medical Center)", contact: "Intake number/mental health issues: 214-456-8899; Children’s Outpatient Psychiatry Clinic:  214-456-5937; Children’s Emergency Room:  214-456-7000", address: "1935 Medical District Drive", city: "Dallas", state: "Texas", zip: "75235", website: "www.childrens.com", addInfo: "Focus: mental health issues, both inpatient and outpatient; Age: children & adolescents up to age 17; Insurance: Variety of insurance companies (call to verify insurance); If a child is suicidal, they should be taken directly to the Emergency Room."),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "The Excel Center Lewisville", contact: "972-906-5522", address: "190 Civic Center, Suite 170", city: "Lewisville", state: "Texas", zip: "75067", website: "www.excelcenterlewisville.com", addInfo: "Focus: specialized day treatment specializing in anger, depression, ADHD and mood disorders; offer Dialectical; Behavior Therapy, EMDR and TBRI; Age: children and adolescents (5-18); Free Assessments; A TEA accredited school is located on campus; Offer transportation options; Insurance: Many major insurance providers. Call to confirm."),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Parkland Hospital (Behavioral Health Center)", contact: "214-590-5536", address: "6300 Harry Hines, 7th floor", city: "Dallas", state: "Texas", zip: "75235", website: "www.parklandhospital.com", addInfo: "Focus: wide range of mental health services (therapy, evaluations, neuropsychology); Age: children, adolescents, adults; Insurance: most major insurance providers, Medicare, and Medicaid. They help patients find financial assistance."),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "SPARC at Children’s (Suicide Prevent and Resilience at Children’s Health)", contact: "214-456-3600", address: "6300 Harry Hines Blvd., Suite 1200", city: "Dallas", state: "Texas", zip: "75235", website: "https://www.childrens.com/specialties-services/specialty-centers-and-programs/psychiatry-and-psychology/conditions-and-programs/suicide-behaviors", addInfo: "The program is for adolescents, who: Are between 12-17 years old, have made a suicide attempt or have significant worsening of suicidal thoughts, require more intensive care than available through outpatient services, are able to attend six to nine hours of treatment each week, are seeing a psychiatrist or therapist. (Assistance in locating these services will be provided.); Current treatment providers and parents can refer adolescents to this program.; Insurance: Many major insurance providers. Call to see options. "),
        Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "University Behavioral Health", contact: "940-320-8100", address: "2026 W. University Dr.", city: "Denton", state: "Texas", zip: "76201", website: "www.ubhdenton.com", addInfo: "24/7 Assessments; Focus: mental health and substance abuse issues; Age: children (5-12 years old), adolescents (13-17 years old) and adults; Insurance: Accepts most major insurances.  They cannot take North Star.; Contact UBH to see if they accept your insurance.")],
        [Resource(category: "Counseling Centers", name: "Coppell Counseling Center", contact: "972-393-1596", address: "413 W. Bethel Road, Suite 100", city: "Coppell", state: "Texas", zip: "75019", website: "www.coppellcounseling.com", addInfo: "A suite of independent licensed mental health practitioners; Coppell Counseling Center mental health professionals participate in many preferred provider organizations.  "),
        Resource(category: "Counseling Centers", name: "Dallas DBT", contact: "972-918-0170", address: "9900 North Central Expressway, Suite 500", city: "Dallas", state: "Texas", zip: "75231", website: "www.dallasdbt.com", addInfo: "Offers tele-health; Focus: Team of clinicians practicing dialectical behavioral therapy through individual therapy, skills groups, coaching calls, and clinician consultations; Age: Children, adolescents, adults, and families; Insurance: They do not accept insurance. See website for rates.  "),
        Resource(category: "Counseling Centers", name: "Family Tree", contact: "972-353-9404; 888-837-0666, ext. 7 (Dallas County)", address: "2727 LBJ Freeway, Suite 406", city: "Farmers Branch", state: "Texas", zip: "75234", website: "www.familytreeprogram.org", addInfo: "Offers tele-health; Family counseling at no cost.; Spanish speaking available; Families are usually eligible if they have a youth 17 or younger in the home, they currently are not receiving services from CPS, and the youth has never been adjudicated of a crime.; Presenting issues can be served in the short term services provided."),
        Resource(category: "Counseling Centers", name: "Holiner Psychiatric Group", contact: "972-566-4591", address: "7777 Forest Lane, Building C, Suite 833", city: "Dallas", state: "Texas", zip: "75230", website: "www.holinergroup.com", addInfo: "Offers tele-health; Offers tele-health; Focus: A full service practice committed to providing high quality psychiatric services.; Age: Children, adolescents and adults.; Insurance: See their website for a list of insurance companies or call to verify.; They accept Medicare, Value Options."),
        Resource(category: "Counseling Centers", name: "Innovation 360", contact: "214-733-9565", address: "6600 LBJ Freeway, Suite 240", city: "Dallas", state: "Texas", zip: "75240", website: "www.i360dallas.com", addInfo: "Focus: A team of certified doctors, psychologists and licensed counselors specializing in mental health treatment, addiction and emerging adulthood.; Age: Teens and adults.; Insurance: They do not accept insurance."),
        Resource(category: "Counseling Centers", name: "Psychological Services of North Texas", contact: "817-416-7169", address: "7135 Colleyville Blvd., Suite 101", city: "Colleyville", state: "Texas", zip: "76034", website: "www.psntdocs.com", addInfo: "Focus: Psychological testing and therapy for anxiety, depression/mood disorders, eating disorders, LGBTQ, parenting, physical health, relationships, sports counseling, and trauma; Dr. Kathleen Nadelson:        Focus: Psychological testing and therapy;        Ages: Children to adults; Insurance: They accept many major insurance groups, Medicare, Medicaid, and offer sliding-scale fees."),
        Resource(category: "Counseling Centers", name: "Richland Oaks Counseling Center", contact: "469-619-7622", address: "1221 Abrams Rd., Suite 325", city: "Richardson", state: "Texas", zip: "75081", website: "www.richlandoaks.org", addInfo: "Offers tele-health; A nonprofit teaching and research clinic with locations in Richardson, Plano, McKinney and Prosper; Full range of counseling services and psychological assessment; Bilingual services in: Spanish, Urdu, Punjabi, Hindi, and conversational ASL; Insurance: They accept many major insurance groups, including Medicare. Call for availability."),
        Resource(category: "Counseling Centers", name: "SMU Center for Family Counseling", contact: "214-768-6789", address: "6116 N. Central Expressway #410", city: "Dallas", state: "Texas", zip: "75206", website: "www.smu.com/familycounseling", addInfo: "In-person and telehealth low-cost counseling for children, adolescents and families; Monday through Thursday from 11:30am-7:30pm"),
        Resource(category: "Counseling Centers", name: "Taylor Counseling Group", contact: "214-530-0021", address: "870 S. Denton Tap Road, Suite 150", city: "Coppell", state: "Texas", zip: "75019", website: "taylorcounselinggroup.com", addInfo: "Offers tele-health; Practice of clinicians that provide individual, family and play therapy for ages 5-adult; Insurance: They are in-network with most major insurance groups. They also offer an affordable care program for reduced fees."),
        Resource(category: "Counseling Centers", name: "University Of North Texas - Counseling and Human Development Center", contact: "940-565-2970", address: "425 S. Welch Street", city: "Denton", state: "Texas", zip: "76203-5017", website: "www.coe.unt.edu/counseling-and-human-development-center", addInfo: "Focus: individual adult/adolescent counseling, career counseling, couples counseling and play therapy provided by advanced masters or beginning doctoral students in professional counseling.; Insurance: They do not accept insurance, Medicaid, or Medicare.; Cost: Sliding fee scales; they do not refuse services for inability to pay.")],
        [Resource(category: "Eating Disorders", name: "Center for Discovery", contact: "1-855-257-4977", address: "5124 Corinthian Bay Drive", city: "Plano", state: "Texas", zip: "75093", website: "https://centerfordiscovery.com/locations/plano/", addInfo: "Focus: Whole person treatment center for males and females who have been diagnosed with an eating disorder; Age: Children and adolescents, age 10-28; Insurance: Accepts most major insurance plans"),
        Resource(category: "Eating Disorders", name: "Children’s Health (Specialty Center 1 Plano)", contact: "469-303-5900; 214-456-8899, option 3 (Eating Disorders New Patient)", address: "7609 Preston Road", city: "Plano", state: "Texas", zip: "75024", website: "www.childrens.com", addInfo: "Focus: Children’s offers a full continuum of specialized services for children and adolescents with eating disorders (male and female). ; Age: Children and adolescents - the only facility in North Texas that offers services for children under 12.; Insurance: Call Children’s to see if they accept your insurance provider."),
        Resource(category: "Eating Disorders", name: "Eating Recovery Center-Dallas", contact: "972-833-2828", address: "5120 Legacy Drive", city: "Plano", state: "Texas", zip: "75024", website: "www.dallas.eatingrecoverycenter.com", addInfo: "Focus: Accredited center for eating disorders treatment and prevention. They serve female and males, adults, children, and adolescents with Anorexia, Bulimia, Binge, Eating Disorders and co-occurring disorders.; They offer inpatient, residential, partial hospitalization and IOP treatment.; Families are involved in the treatment process.; Age: Children must be at least 10 years old.; Insurance: Accept many major insurance companies, however the list changes frequently.  Accepts Value Options. Call insurance and financial specialists for a benefits check. "),
        Resource(category: "Eating Disorders", name: "Elisa Project", contact: "866-837-1999; 214-369-5222", address: "10300 N. Central Expressway, #330", city: "Dallas", state: "Texas", zip: "75231", website: "www.theelisaproject.org", addInfo: "Focus: Fighting against eating disorders through education, support, and advocacy.  The ELISA project is not a treatment center; Connect families and individuals with resources.; Age: Resources for all ages, from young children to adults.; Cost: Free of charge"),
        Resource(category: "Eating Disorders", name: "Walker Wellness", contact: "(214) 549-2901", address: "12200 Preston Road", city: "Dallas", state: "Texas", zip: "75230", website: "www.walkerwellness.com", addInfo: "Focus: Individualized treatment plan to help men, women, and adolescents who are dealing with eating disorders and body image issues, depression, anxiety, obsessive-compulsive disorders. They offer day program, intensive outpatient, and standard outpatient treatment options.; Age: Adolescents 12 and older and Adults; Insurance: They do not accept insurance.")],
        [Resource(category: "Drug and Alcohol Abuse", name: "Hazelden Betty Ford Foundation", contact: "1-800-257-7810", address: "", city: "", state: "Texas", zip: "", website: "https://hazelden.org", addInfo: "Drug addiction treatment provider with 17 sites nationwide; Website offers valuable information on addiction for individuals and families.; Online bookstore."),
        Resource(category: "Drug and Alcohol Abuse", name: "Adolescent Drug and Alcohol Assessments - Solutions Outpatient Services", contact: "214-369-1155", address: "4300 MacArthur Avenue, Suite 270", city: "Dallas", state: "Texas", zip: "75209", website: "www.sosdallas.com", addInfo: "Provides comprehensive substance abuse/dependence evaluations for adolescents and adults; They offer an alcohol, drug abuse, and separate eating disorder intensive outpatient treatment program for adults."),
        Resource(category: "Drug and Alcohol Abuse", name: "Adolescent Drug and Alcohol Assessments - Dallas Recovery Center", contact: "214-789-8456", address: "4950 Keller Springs Rd., Suite 180", city: "Addison", state: "Texas", zip: "75001", website: "https://jimsavage.net/counseling-services/assessment.html", addInfo: "Jim Savage, LCDC, owner and therapist; Adolescent assessment (prevention and intervention); Counseling services, parent seminars and aftercare support.; Insurance is not accepted."),
        Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Capstone Treatment Center", contact: "866-729-4479", address: "120 Meghan Lane", city: "Judsonia", state: "Arizona", zip: "72081", website: "www.capstonetreatmentcenter.com", addInfo: "Focus: Behavioral Health system based on a Christian foundation which emphasizes on addiction, trauma, family conflict, and co-occurring disorders.; Age: A residential programs that works with adolescent and young adult males; Insurance: Reimbursement only"),
        Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Memorial Hermann Houston", contact: "713-939-7272", address: "3043 Gessner Road", city: "Houston", state: "Texas", zip: "77080", website: "parc.memorialhermann.org", addInfo: "Focus: Hospital based program for substance abuse treatment for people who are struggling with addiction. They offer residential treatment, partial hospitalization, intensive outpatient, aftercare programs, and family rehab.; Age: Teens (13-17), Young Adults (18-24), and Adults (25+); Several layers of care; Insurance: Accept most major insurances but do not accept Medicare, Medicaid, Tricare, Amerigroup, STAR, CHIP"),
        Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - NEXUS Recovery Center", contact: "214-321-0156 X 3118", address: "8733 LaPrada Dr.", city: "Dallas", state: "Texas", zip: "75228", website: "www.nexusrecovery.org", addInfo: "Focus: Substance abuse services for teenage girls and adult women. The only drug treatment facility in Texas that accommodates a late term pregnancy or a newly parenting teen.; Allows women 18 and older to bring as many as 3 children.; Age: Girls 13-17, Women; Insurance: Many insurance plans are accepted."),
        Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Sundown Ranch", contact: "903-479-3933", address: "3120 VZ County Rd. 2318", city: "Canton", state: "Texas", zip: "75103", website: "https://sundownranchinc.com", addInfo: "Focus: Treats adolescents and young adults suffering from substance abuse disorder or chemical dependency through residential treatment, aftercare planning and an academic program.; Age: 12-24; Insurance: Many major insurances accepted. Call to verify. "),
        Resource(category: "Drug and Alcohol Abuse", name: "Timberline Knolls", contact: "855-254-8326", address: "40 Timberline Drive", city: "Lemont", state: "Illinois", zip: "60439", website: "www.timberlineknolls.com", addInfo: "Focus: Residential treatment center with a focus on eating disorders, substance abuse and addiction, mood disorders and trauma.; Age: Females 12 and older; Insurance: Many major insurances accepted.")],
        [Resource(category: "Specialty Counseling", name: "Art Therapy - The Art Station", contact: "817-921-2401", address: "1616 Park Place", city: "Fort Worth", state: "Texas", zip: "76110", website: "www.theartstation.org", addInfo: "Focus: Individual and group art therapy including assessments.; Clients:  Young children to adults; Insurance: Accept some insurance plans and may provide financial assistance.; Usually a waiting list.")],
    ]
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        
        Dictionary(grouping: self.resources) { (resources) -> String in
            return categorySection(resources.categoryType)
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return resources.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resources[section].count
        //count = 0
        /*if counter != 0 {
            count = tempArray.count
        }
        counter += 1*/
        
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resourceCell", for: indexPath)

        // Configure the cell...
        
        //let resource = resources[indexPath.row]
        let resource = resources[indexPath.section][indexPath.row]
        cell.textLabel?.text = resource.name

        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let categoryArray = ["Crisis Lines", "Inpatient/Outpatient Mental Health Facilities", "Counseling Centers", "Eating Disorders", "Drug and Alcohol Abuse", "Specialty Counseling"]
        return categoryArray[section]
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        //performSegue(withIdentifier: "resIden", sender: self)
        
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}



class Resource{
    var category: String
    var name: String
    var contact: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var website: String
    var addInfo: String
    static var myArray: [Resource] {
        var arr: [Resource] = []
        var res = Resource(category: "Crisis Lines", name: "Child Protective Services", contact: "1-800-252-5400", address: "", city: "", state: "", zip: "", website: "", addInfo: "-Texas law says anyone who thinks a child, or person 65 years or older, or an adult with disabilities is being abused, neglected, or exploited must report it to DFPS. A person who reports abuse in good faith is immune from civil or criminal liability")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "National Suicide Prevention Lifeline", contact: "Call or text 988 or 1-800-273-8255", address: "", city: "", state: "", zip: "", website: "https://suicidepreventionlifeline.org/", addInfo: "-24/7 free, confidential support for anyone in distress\n-Prevention and crisis resources for you or loved ones")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "Crisis Text Line", contact: "Text ‘HELLO’ to 741741 ", address: "", city: "", state: "", zip: "", website: "", addInfo: "-")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "Suicide Crisis Center of North Texas", contact: "214-828-1000", address: "", city: "", state: "", zip: "", website: "", addInfo: "-Suicide and Crisis Hotline\n-Available 24/7 for anyone in crisis or contemplating suicide\n-Programs for those who have lost a loved one to suicide (free)\n-Teen Programs (TeenScreen) (free)")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "Texas Youth and Runaway Hotline", contact: "Hotline: 1-800-989-6884\n-Texting - 512-872-5777\n-Chat - texasyouth.org", address: "", city: "", state: "", zip: "", website: "texasyouth.org", addInfo: "-Individuals can call, chat or text\n-Crisis Intervention\n-Referrals for callers who need shelter, counseling, and transportation home\n-A confidential message relay service is available to promote communications between runaways and their families")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "Love is Respect", contact: "Hotline: 1-866-331-9474\n-Texting - love is to 22522\n-Chat - loveisrespect.org", address: "", city: "", state: "", zip: "", website: "loveisrespect.org", addInfo: "-24 hour web based and telephone helpline from National Domestic Violence Hotline\n-Created to help teens (ages 13-18) to prevent and end dating abuse")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "The Trevor Project", contact: "1-866-488-7386", address: "", city: "", state: "", zip: "", website: "thetrevorproject.org", addInfo: "-Hotline 24/7\n-Individuals can call, chat, or text\n-Crisis Intervention and suicide prevention services for lesbian, gay, bisexual, transgender and questioning (LGBTQ) youth under age 25")
        arr.append(res)
        res = Resource(category: "Crisis Lines", name: "Here for Texas", contact: "972-525-8181", address: "", city: "", state: "", zip: "", website: "www.herefortexas.com", addInfo: "-Free Service\n-Connects individuals to a trained mental health navigator who can offer support and information about mental health services in our area\n-Resources are available for anxiety, depression, bipolar, addictions, and other mental health conditions\n-Helps with transportation to the mental health facility")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Carrollton Springs", contact: "972-544-7980", address: "2225 Parker Road", city: "Carrollton", state: "Texas", zip: "75010", website: "https://carrolltonsprings.com/programs/inpatient-treatment/", addInfo: "-Offers telehealth\n-Focus: Offers inpatient mental health treatment\n-Cost: Accepts most major insurance plans")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Carrollton Springs Changes ", contact: "469-850-2040", address: "6870 Lebanon Road, Suite 300", city: "Frisco", state: "Texas", zip: "75034", website: "https://carrolltonsprings.com/locations/frisco-tx/", addInfo: "-Offers telehealth\n-Focus: Offers mental health treatment on an outpatient basis through PHP and IOP\n-Ages: Serves children and adolescents ages 11-18\n-Cost: Accepts most major insurance plans")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Charles E. Seay Behavioral Health Center", contact: "682-549-7934 ", address: "6110 W. Parker Road", city: "Plano", state: "Texas", zip: "75093", website: "www.texashealth.org", addInfo: "-8 a.m. to 8 p.m\n-After hours emergency\n-Mental Health Facility\n-Focus: mental health, drug and alcohol issues. Offers inpatient, PHP and IOP\n-Age: Adolescents 12-17. Adults 18 and older will be referred to the adult unit. Children 11 and under will be referred to Children’s Health\n-Insurance: Approved provider for most major care insurance plans. Contact to see if they accept your insurance plan.")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Children’s Health (formerly Children’s Medical Center)", contact: "Intake number/mental health issues: 214-456-8899\n-Children’s Outpatient Psychiatry Clinic:  214-456-5937\n-Children’s Emergency Room:  214-456-7000", address: "1935 Medical District Drive", city: "Dallas", state: "Texas", zip: "75235", website: "www.childrens.com", addInfo: "-Focus: mental health issues, both inpatient and outpatient\n-Age: children & adolescents up to age 17\n-Insurance: Variety of insurance companies (call to verify insurance)\n-If a child is suicidal, they should be taken directly to the Emergency Room.")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "The Excel Center Lewisville", contact: "972-906-5522", address: "190 Civic Center, Suite 170", city: "Lewisville", state: "Texas", zip: "75067", website: "www.excelcenterlewisville.com", addInfo: "-Focus: specialized day treatment specializing in anger, depression, ADHD and mood disorders\n-offer Dialectical\n-Behavior Therapy, EMDR and TBRI\n-Age: children and adolescents (5-18)\n-Free Assessments\n-A TEA accredited school is located on campus\n-Offer transportation options\n-Insurance: Many major insurance providers. Call to confirm.")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "Parkland Hospital (Behavioral Health Center)", contact: "214-590-5536", address: "6300 Harry Hines, 7th floor", city: "Dallas", state: "Texas", zip: "75235", website: "www.parklandhospital.com", addInfo: "-Focus: wide range of mental health services (therapy, evaluations, neuropsychology)\n-Age: children, adolescents, adults\n-Insurance: most major insurance providers, Medicare, and Medicaid. They help patients find financial assistance.")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "SPARC at Children’s (Suicide Prevent and Resilience at Children’s Health)", contact: "214-456-3600", address: "6300 Harry Hines Blvd., Suite 1200", city: "Dallas", state: "Texas", zip: "75235", website: "https://www.childrens.com/specialties-services/specialty-centers-and-programs/psychiatry-and-psychology/conditions-and-programs/suicide-behaviors", addInfo: "-The program is for adolescents, who: Are between 12-17 years old, have made a suicide attempt or have significant worsening of suicidal thoughts, require more intensive care than available through outpatient services, are able to attend six to nine hours of treatment each week, are seeing a psychiatrist or therapist. (Assistance in locating these services will be provided.)\n-Current treatment providers and parents can refer adolescents to this program.\n-Insurance: Many major insurance providers. Call to see options. ")
        arr.append(res)
        res = Resource(category: "Inpatient/Outpatient Mental Health Facilities", name: "University Behavioral Health", contact: "940-320-8100", address: "2026 W. University Dr.", city: "Denton", state: "Texas", zip: "76201", website: "www.ubhdenton.com", addInfo: "-24/7 Assessments\n-Focus: mental health and substance abuse issues\n-Age: children (5-12 years old), adolescents (13-17 years old) and adults\n-Insurance: Accepts most major insurances.  They cannot take North Star.\n-Contact UBH to see if they accept your insurance.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Coppell Counseling Center", contact: "972-393-1596", address: "413 W. Bethel Road, Suite 100", city: "Coppell", state: "Texas", zip: "75019", website: "www.coppellcounseling.com", addInfo: "-A suite of independent licensed mental health practitioners\n-Coppell Counseling Center mental health professionals participate in many preferred provider organizations.  ")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Dallas DBT", contact: "972-918-0170", address: "9900 North Central Expressway, Suite 500", city: "Dallas", state: "Texas", zip: "75231", website: "www.dallasdbt.com", addInfo: "-Offers tele-health\n-Focus: Team of clinicians practicing dialectical behavioral therapy through individual therapy, skills groups, coaching calls, and clinician consultations\n-Age: Children, adolescents, adults, and families\n-Insurance: They do not accept insurance. See website for rates.  ")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Family Tree", contact: "972-353-9404\n-888-837-0666, ext. 7 (Dallas County)", address: "2727 LBJ Freeway, Suite 406", city: "Farmers Branch", state: "Texas", zip: "75234", website: "www.familytreeprogram.org", addInfo: "-Offers tele-health\n-Family counseling at no cost.\n-Spanish speaking available\n-Families are usually eligible if they have a youth 17 or younger in the home, they currently are not receiving services from CPS, and the youth has never been adjudicated of a crime.\n-Presenting issues can be served in the short term services provided.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Holiner Psychiatric Group", contact: "972-566-4591", address: "7777 Forest Lane, Building C, Suite 833", city: "Dallas", state: "Texas", zip: "75230", website: "www.holinergroup.com", addInfo: "-Offers tele-health\n-Offers tele-health\n-Focus: A full service practice committed to providing high quality psychiatric services.\n-Age: Children, adolescents and adults.\n-Insurance: See their website for a list of insurance companies or call to verify.\n-They accept Medicare, Value Options.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Innovation 360", contact: "214-733-9565", address: "6600 LBJ Freeway, Suite 240", city: "Dallas", state: "Texas", zip: "75240", website: "www.i360dallas.com", addInfo: "-Focus: A team of certified doctors, psychologists and licensed counselors specializing in mental health treatment, addiction and emerging adulthood.\n-Age: Teens and adults.\n-Insurance: They do not accept insurance.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Psychological Services of North Texas", contact: "817-416-7169", address: "7135 Colleyville Blvd., Suite 101", city: "Colleyville", state: "Texas", zip: "76034", website: "www.psntdocs.com", addInfo: "-Focus: Psychological testing and therapy for anxiety, depression/mood disorders, eating disorders, LGBTQ, parenting, physical health, relationships, sports counseling, and trauma\n-Dr. Kathleen Nadelson:        Focus: Psychological testing and therapy\n-       Ages: Children to adults\n-Insurance: They accept many major insurance groups, Medicare, Medicaid, and offer sliding-scale fees.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Richland Oaks Counseling Center", contact: "469-619-7622", address: "1221 Abrams Rd., Suite 325", city: "Richardson", state: "Texas", zip: "75081", website: "www.richlandoaks.org", addInfo: "-Offers tele-health\n-A nonprofit teaching and research clinic with locations in Richardson, Plano, McKinney and Prosper\n-Full range of counseling services and psychological assessment\n-Bilingual services in: Spanish, Urdu, Punjabi, Hindi, and conversational ASL\n-Insurance: They accept many major insurance groups, including Medicare. Call for availability.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "SMU Center for Family Counseling", contact: "214-768-6789", address: "6116 N. Central Expressway #410", city: "Dallas", state: "Texas", zip: "75206", website: "www.smu.com/familycounseling", addInfo: "-In-person and telehealth low-cost counseling for children, adolescents and families\n-Monday through Thursday from 11:30am-7:30pm")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "Taylor Counseling Group", contact: "214-530-0021", address: "870 S. Denton Tap Road, Suite 150", city: "Coppell", state: "Texas", zip: "75019", website: "taylorcounselinggroup.com", addInfo: "-Offers tele-health\n-Practice of clinicians that provide individual, family and play therapy for ages 5-adult\n-Insurance: They are in-network with most major insurance groups. They also offer an affordable care program for reduced fees.")
        arr.append(res)
        res = Resource(category: "Counseling Centers", name: "University Of North Texas - Counseling and Human Development Center", contact: "940-565-2970", address: "425 S. Welch Street", city: "Denton", state: "Texas", zip: "76203-5017", website: "www.coe.unt.edu/counseling-and-human-development-center", addInfo: "-Focus: individual adult/adolescent counseling, career counseling, couples counseling and play therapy provided by advanced masters or beginning doctoral students in professional counseling.\n-Insurance: They do not accept insurance, Medicaid, or Medicare.\n-Cost: Sliding fee scales\n-they do not refuse services for inability to pay.")
        arr.append(res)
        res = Resource(category: "Eating Disorders", name: "Center for Discovery", contact: "1-855-257-4977", address: "5124 Corinthian Bay Drive", city: "Plano", state: "Texas", zip: "75093", website: "https://centerfordiscovery.com/locations/plano/", addInfo: "-Focus: Whole person treatment center for males and females who have been diagnosed with an eating disorder\n-Age: Children and adolescents, age 10-28\n-Insurance: Accepts most major insurance plans")
        arr.append(res)
        res = Resource(category: "Eating Disorders", name: "Children’s Health (Specialty Center 1 Plano)", contact: "469-303-5900\n-214-456-8899, option 3 (Eating Disorders New Patient)", address: "7609 Preston Road", city: "Plano", state: "Texas", zip: "75024", website: "www.childrens.com", addInfo: "-Focus: Children’s offers a full continuum of specialized services for children and adolescents with eating disorders (male and female). \n-Age: Children and adolescents - the only facility in North Texas that offers services for children under 12.\n-Insurance: Call Children’s to see if they accept your insurance provider.")
        arr.append(res)
        res = Resource(category: "Eating Disorders", name: "Eating Recovery Center-Dallas", contact: "972-833-2828", address: "5120 Legacy Drive", city: "Plano", state: "Texas", zip: "75024", website: "www.dallas.eatingrecoverycenter.com", addInfo: "-Focus: Accredited center for eating disorders treatment and prevention. They serve female and males, adults, children, and adolescents with Anorexia, Bulimia, Binge, Eating Disorders and co-occurring disorders.\n-They offer inpatient, residential, partial hospitalization and IOP treatment.\n-Families are involved in the treatment process.\n-Age: Children must be at least 10 years old.\n-Insurance: Accept many major insurance companies, however the list changes frequently.  Accepts Value Options. Call insurance and financial specialists for a benefits check. ")
        arr.append(res)
        res = Resource(category: "Eating Disorders", name: "Elisa Project", contact: "866-837-1999\n-214-369-5222", address: "10300 N. Central Expressway, #330", city: "Dallas", state: "Texas", zip: "75231", website: "www.theelisaproject.org", addInfo: "-Focus: Fighting against eating disorders through education, support, and advocacy.  The ELISA project is not a treatment center\n-Connect families and individuals with resources.\n-Age: Resources for all ages, from young children to adults.\n-Cost: Free of charge")
        arr.append(res)
        res = Resource(category: "Eating Disorders", name: "Walker Wellness", contact: "(214) 549-2901", address: "12200 Preston Road", city: "Dallas", state: "Texas", zip: "75230", website: "www.walkerwellness.com", addInfo: "-Focus: Individualized treatment plan to help men, women, and adolescents who are dealing with eating disorders and body image issues, depression, anxiety, obsessive-compulsive disorders. They offer day program, intensive outpatient, and standard outpatient treatment options.\n-Age: Adolescents 12 and older and Adults\n-Insurance: They do not accept insurance.")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Hazelden Betty Ford Foundation", contact: "1-800-257-7810", address: "", city: "", state: "Texas", zip: "", website: "https://hazelden.org", addInfo: "-Drug addiction treatment provider with 17 sites nationwide\n-Website offers valuable information on addiction for individuals and families.\n-Online bookstore.")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Adolescent Drug and Alcohol Assessments - Solutions Outpatient Services", contact: "214-369-1155", address: "4300 MacArthur Avenue, Suite 270", city: "Dallas", state: "Texas", zip: "75209", website: "www.sosdallas.com", addInfo: "-Provides comprehensive substance abuse/dependence evaluations for adolescents and adults\n-They offer an alcohol, drug abuse, and separate eating disorder intensive outpatient treatment program for adults.")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Adolescent Drug and Alcohol Assessments - Dallas Recovery Center", contact: "214-789-8456", address: "4950 Keller Springs Rd., Suite 180", city: "Addison", state: "Texas", zip: "75001", website: "https://jimsavage.net/counseling-services/assessment.html", addInfo: "-Jim Savage, LCDC, owner and therapist\n-Adolescent assessment (prevention and intervention)\n-Counseling services, parent seminars and aftercare support.\n-Insurance is not accepted.")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Capstone Treatment Center", contact: "866-729-4479", address: "120 Meghan Lane", city: "Judsonia", state: "Arizona", zip: "72081", website: "www.capstonetreatmentcenter.com", addInfo: "-Focus: Behavioral Health system based on a Christian foundation which emphasizes on addiction, trauma, family conflict, and co-occurring disorders.\n-Age: A residential programs that works with adolescent and young adult males\n-Insurance: Reimbursement only")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Memorial Hermann Houston", contact: "713-939-7272", address: "3043 Gessner Road", city: "Houston", state: "Texas", zip: "77080", website: "parc.memorialhermann.org", addInfo: "-Focus: Hospital based program for substance abuse treatment for people who are struggling with addiction. They offer residential treatment, partial hospitalization, intensive outpatient, aftercare programs, and family rehab.\n-Age: Teens (13-17), Young Adults (18-24), and Adults (25+)\n-Several layers of care\n-Insurance: Accept most major insurances but do not accept Medicare, Medicaid, Tricare, Amerigroup, STAR, CHIP")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - NEXUS Recovery Center", contact: "214-321-0156 X 3118", address: "8733 LaPrada Dr.", city: "Dallas", state: "Texas", zip: "75228", website: "www.nexusrecovery.org", addInfo: "-Focus: Substance abuse services for teenage girls and adult women. The only drug treatment facility in Texas that accommodates a late term pregnancy or a newly parenting teen.\n-Allows women 18 and older to bring as many as 3 children.\n-Age: Girls 13-17, Women\n-Insurance: Many insurance plans are accepted.")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Residential Inpatient Treatment for Adolescents Suffering From Chemical Dependency - Sundown Ranch", contact: "903-479-3933", address: "3120 VZ County Rd. 2318", city: "Canton", state: "Texas", zip: "75103", website: "https://sundownranchinc.com", addInfo: "-Focus: Treats adolescents and young adults suffering from substance abuse disorder or chemical dependency through residential treatment, aftercare planning and an academic program.\n-Age: 12-24\n-Insurance: Many major insurances accepted. Call to verify. ")
        arr.append(res)
        res = Resource(category: "Drug and Alcohol Abuse", name: "Timberline Knolls", contact: "855-254-8326", address: "40 Timberline Drive", city: "Lemont", state: "Illinois", zip: "60439", website: "www.timberlineknolls.com", addInfo: "-Focus: Residential treatment center with a focus on eating disorders, substance abuse and addiction, mood disorders and trauma.\n-Age: Females 12 and older\n-Insurance: Many major insurances accepted.")
        arr.append(res)
        res = Resource(category: "Specialty Counseling", name: "Art Therapy - The Art Station", contact: "817-921-2401", address: "1616 Park Place", city: "Fort Worth", state: "Texas", zip: "76110", website: "www.theartstation.org", addInfo: "-Focus: Individual and group art therapy including assessments.\n-Clients:  Young children to adults\n-Insurance: Accept some insurance plans and may provide financial assistance.\n-Usually a waiting list.")
        arr.append(res)
        return arr
    }
    
    
    init(category: String, name: String, contact: String, address: String, city: String, state: String, zip: String, website: String, addInfo: String) {
        self.category = category
        self.name = name
        self.contact = contact
        self.address = address
        self.city = city
        self.state = state
        self.zip = zip
        self.website = website
        self.addInfo = addInfo
    }
    
}
class specificResourceViewController: UIViewController {
    @IBOutlet var resNameLabel: UILabel!
    @IBOutlet var resCatLabel: UILabel!
    @IBOutlet var resDescLabel: UILabel!
    @IBOutlet var resWebLabel: UILabel!
    @IBOutlet var resContLabel: UILabel!
    @IBOutlet var resAddressLabel: UILabel!
    var ad = Resource.myArray[myIndex].address
    var ci = Resource.myArray[myIndex].city
    var st = Resource.myArray[myIndex].state
    var zi = Resource.myArray[myIndex].zip
    override func viewDidLoad() {
        super.viewDidLoad()
        resNameLabel.text = Resource.myArray[myIndex].name
        resCatLabel.text = Resource.myArray[myIndex].category
        resDescLabel.text = Resource.myArray[myIndex].addInfo
        resWebLabel.text = Resource.myArray[myIndex].website
        resContLabel.text = Resource.myArray[myIndex].contact
        if(Resource.myArray[myIndex].category == "Crisis Lines"){
            resAddressLabel.text = "";
        }
        else{
            resAddressLabel.text = ad + " " + ci + ", " + st + " " + zi
        }
    }
    
}
