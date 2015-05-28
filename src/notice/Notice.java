package notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;

import com.cedarsoftware.util.io.JsonReader;
import com.cedarsoftware.util.io.JsonWriter;

public class Notice {

	// ================= Pre Problems =================
	public String institutionName;
	public String lastRevDate;

	public boolean hasAffiliates;

	public boolean optByPhone;
	public boolean optByWebsite;
	public boolean optByMail;

	// ================= Facts - Page 1 =================
	// What?
	public ArrayList<String> PersonalInfoTypes = new ArrayList<String>();

	// Reasons we can share your personal information
	public boolean[] isShared = new boolean[7]; // 6th valid when hasAffiliates == true
	public boolean[] isLimited = new boolean[7]; // 6th valid when hasAffiliates ==
											// true

	// To limit our sharing
	public int sharelimitDays = -1;
	public String optPhone; // Valid when optByPhone == true
	public String optWebsite; // Valid when optByPhone == true

	// Mail-in Form
	public String Address;
	public String city;
	public String state;
	public String zipcode;
	
	// Questions
	public boolean contactByPhone;
	public boolean contactByWebsite;
	public String contactPhone; // Valid when providedPhone == true
	public String contactWebsite; // Valid when providedWebsite == true

	// ================= Page 2 =================
	// What we do
	// How does [name] protect my personal information
	public String protectWay;

	// How does [name] collect my personal information
	public ArrayList<String> collectWays = new ArrayList<String>();
	public boolean collectFromCompanies;
	public boolean collectFromOthers;

	// Why can't I limit all sharing?
	public boolean provideLaw;
	public String law;

	// What happen when I limit sharing...
	public boolean applyToEveryone;

	// Definitions
	public String affiliates;
	public String nonaffiliates;
	public String jointMarketing;

	// Other important information
	public String otherInfo;

	/*****************************************************
	 ********************** JSON I/O**********************
	 *****************************************************/

	public String writeToJSON() {
		return JsonWriter.objectToJson(this);//.replace("\"", "");
	}
	
	@SuppressWarnings("resource")
	public static Notice readFromJSON (InputStream inputStream) throws FileNotFoundException {
		JsonReader jr = new JsonReader(inputStream);
		return (Notice) jr.readObject();
	}
	
	public static void main(String[] args) {
		Notice notice = new Notice();
		notice.institutionName = "HAHAHA";
		notice.lastRevDate = "BBBB";
		System.out.println(notice.writeToJSON());
	}
}
