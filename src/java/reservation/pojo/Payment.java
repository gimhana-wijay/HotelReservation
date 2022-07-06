package reservation.pojo;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Gimhana Sandakelum
 */
@Entity
@Table(name = "payment")
@NamedQueries({ @NamedQuery(name = "Payment.findAll", query = "SELECT p FROM Payment p"),
		@NamedQuery(name = "Payment.findByPaymentId", query = "SELECT p FROM Payment p WHERE p.paymentId = :paymentId"),
		@NamedQuery(name = "Payment.findByName", query = "SELECT p FROM Payment p WHERE p.name = :name"),
		@NamedQuery(name = "Payment.findByCountry", query = "SELECT p FROM Payment p WHERE p.country = :country"),
		@NamedQuery(name = "Payment.findByAddress", query = "SELECT p FROM Payment p WHERE p.address = :address"),
		@NamedQuery(name = "Payment.findByDescreption", query = "SELECT p FROM Payment p WHERE p.descreption = :descreption"),
		@NamedQuery(name = "Payment.findByPhone", query = "SELECT p FROM Payment p WHERE p.phone = :phone"),
		@NamedQuery(name = "Payment.findByEmail", query = "SELECT p FROM Payment p WHERE p.email = :email"),
		@NamedQuery(name = "Payment.findByConfirm", query = "SELECT p FROM Payment p WHERE p.confirm = :confirm"),
		@NamedQuery(name = "Payment.findByBookingType", query = "SELECT p FROM Payment p WHERE p.bookingType = :bookingType"),
		@NamedQuery(name = "Payment.findByHotelID", query = "SELECT p FROM Payment p WHERE p.hotelID = :hotelID"),
		@NamedQuery(name = "Payment.findByHotelName", query = "SELECT p FROM Payment p WHERE p.hotelName = :hotelName"),
		@NamedQuery(name = "Payment.findByHotelLocation", query = "SELECT p FROM Payment p WHERE p.hotelLocation = :hotelLocation"),
		@NamedQuery(name = "Payment.findByHotelAddress", query = "SELECT p FROM Payment p WHERE p.hotelAddress = :hotelAddress"),
		@NamedQuery(name = "Payment.findByHotelPhone", query = "SELECT p FROM Payment p WHERE p.hotelPhone = :hotelPhone"),
		@NamedQuery(name = "Payment.findByHotelEmail", query = "SELECT p FROM Payment p WHERE p.hotelEmail = :hotelEmail"),
		@NamedQuery(name = "Payment.findByHotelStar", query = "SELECT p FROM Payment p WHERE p.hotelStar = :hotelStar"),
		@NamedQuery(name = "Payment.findByHotelEnabled", query = "SELECT p FROM Payment p WHERE p.hotelEnabled = :hotelEnabled"),
		@NamedQuery(name = "Payment.findByRoomId", query = "SELECT p FROM Payment p WHERE p.roomId = :roomId"),
		@NamedQuery(name = "Payment.findByRoomCode", query = "SELECT p FROM Payment p WHERE p.roomCode = :roomCode"),
		@NamedQuery(name = "Payment.findByRoomType", query = "SELECT p FROM Payment p WHERE p.roomType = :roomType"),
		@NamedQuery(name = "Payment.findByBedType", query = "SELECT p FROM Payment p WHERE p.bedType = :bedType"),
		@NamedQuery(name = "Payment.findByRoomEnabled", query = "SELECT p FROM Payment p WHERE p.roomEnabled = :roomEnabled"),
		@NamedQuery(name = "Payment.findByAllRoomsPrice", query = "SELECT p FROM Payment p WHERE p.allRoomsPrice = :allRoomsPrice"),
		@NamedQuery(name = "Payment.findByInventoryId", query = "SELECT p FROM Payment p WHERE p.inventoryId = :inventoryId"),
		@NamedQuery(name = "Payment.findByInventoryFrom", query = "SELECT p FROM Payment p WHERE p.inventoryFrom = :inventoryFrom"),
		@NamedQuery(name = "Payment.findByInventoryTo", query = "SELECT p FROM Payment p WHERE p.inventoryTo = :inventoryTo"),
		@NamedQuery(name = "Payment.findByInventoryCount", query = "SELECT p FROM Payment p WHERE p.inventoryCount = :inventoryCount"),
		@NamedQuery(name = "Payment.findByInventoryDates", query = "SELECT p FROM Payment p WHERE p.inventoryDates = :inventoryDates") })
public class Payment implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "paymentId")
	private Integer paymentId;
	@Size(max = 45)
	@Column(name = "name")
	private String name;
	@Size(max = 100)
	@Column(name = "country")
	private String country;
	@Size(max = 100)
	@Column(name = "address")
	private String address;
	@Size(max = 100)
	@Column(name = "descreption")
	private String descreption;
	// @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$",
	// message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field
	// contains phone or fax number consider using this annotation to enforce field
	// validation
	@Size(max = 20)
	@Column(name = "phone")
	private String phone;
	// @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
	// message="Invalid email")//if the field contains email address consider using
	// this annotation to enforce field validation
	@Size(max = 45)
	@Column(name = "email")
	private String email;
	@Size(max = 1)
	@Column(name = "confirm")
	private String confirm;
	@Size(max = 45)
	@Column(name = "bookingType")
	private String bookingType;
	@Size(max = 100)
	@Column(name = "hotelID")
	private String hotelID;
	@Size(max = 100)
	@Column(name = "hotelName")
	private String hotelName;
	@Size(max = 100)
	@Column(name = "hotelLocation")
	private String hotelLocation;
	@Size(max = 100)
	@Column(name = "hotelAddress")
	private String hotelAddress;
	@Size(max = 100)
	@Column(name = "hotelPhone")
	private String hotelPhone;
	@Size(max = 100)
	@Column(name = "hotelEmail")
	private String hotelEmail;
	@Size(max = 100)
	@Column(name = "hotelStar")
	private String hotelStar;
	@Size(max = 100)
	@Column(name = "hotelEnabled")
	private String hotelEnabled;
	@Column(name = "roomId")
	private Integer roomId;
	@Size(max = 100)
	@Column(name = "roomCode")
	private String roomCode;
	@Size(max = 100)
	@Column(name = "roomType")
	private String roomType;
	@Size(max = 100)
	@Column(name = "bedType")
	private String bedType;
	@Size(max = 100)
	@Column(name = "roomEnabled")
	private String roomEnabled;
	@Column(name = "allRoomsPrice")
	private BigInteger allRoomsPrice;
	@Column(name = "inventoryId")
	private Integer inventoryId;
	@Size(max = 100)
	@Column(name = "inventoryFrom")
	private String inventoryFrom;
	@Size(max = 100)
	@Column(name = "inventoryTo")
	private String inventoryTo;
	@Column(name = "inventoryCount")
	private Integer inventoryCount;
	@Size(max = 100)
	@Column(name = "inventoryDates")
	private String inventoryDates;

	public Payment() {
	}

	public Payment(Integer paymentId) {
		this.paymentId = paymentId;
	}

	public Integer getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(Integer paymentId) {
		this.paymentId = paymentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescreption() {
		return descreption;
	}

	public void setDescreption(String descreption) {
		this.descreption = descreption;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getBookingType() {
		return bookingType;
	}

	public void setBookingType(String bookingType) {
		this.bookingType = bookingType;
	}

	public String getHotelID() {
		return hotelID;
	}

	public void setHotelID(String hotelID) {
		this.hotelID = hotelID;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getHotelLocation() {
		return hotelLocation;
	}

	public void setHotelLocation(String hotelLocation) {
		this.hotelLocation = hotelLocation;
	}

	public String getHotelAddress() {
		return hotelAddress;
	}

	public void setHotelAddress(String hotelAddress) {
		this.hotelAddress = hotelAddress;
	}

	public String getHotelPhone() {
		return hotelPhone;
	}

	public void setHotelPhone(String hotelPhone) {
		this.hotelPhone = hotelPhone;
	}

	public String getHotelEmail() {
		return hotelEmail;
	}

	public void setHotelEmail(String hotelEmail) {
		this.hotelEmail = hotelEmail;
	}

	public String getHotelStar() {
		return hotelStar;
	}

	public void setHotelStar(String hotelStar) {
		this.hotelStar = hotelStar;
	}

	public String getHotelEnabled() {
		return hotelEnabled;
	}

	public void setHotelEnabled(String hotelEnabled) {
		this.hotelEnabled = hotelEnabled;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public String getRoomCode() {
		return roomCode;
	}

	public void setRoomCode(String roomCode) {
		this.roomCode = roomCode;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getBedType() {
		return bedType;
	}

	public void setBedType(String bedType) {
		this.bedType = bedType;
	}

	public String getRoomEnabled() {
		return roomEnabled;
	}

	public void setRoomEnabled(String roomEnabled) {
		this.roomEnabled = roomEnabled;
	}

	public BigInteger getAllRoomsPrice() {
		return allRoomsPrice;
	}

	public void setAllRoomsPrice(BigInteger allRoomsPrice) {
		this.allRoomsPrice = allRoomsPrice;
	}

	public Integer getInventoryId() {
		return inventoryId;
	}

	public void setInventoryId(Integer inventoryId) {
		this.inventoryId = inventoryId;
	}

	public String getInventoryFrom() {
		return inventoryFrom;
	}

	public void setInventoryFrom(String inventoryFrom) {
		this.inventoryFrom = inventoryFrom;
	}

	public String getInventoryTo() {
		return inventoryTo;
	}

	public void setInventoryTo(String inventoryTo) {
		this.inventoryTo = inventoryTo;
	}

	public Integer getInventoryCount() {
		return inventoryCount;
	}

	public void setInventoryCount(Integer inventoryCount) {
		this.inventoryCount = inventoryCount;
	}

	public String getInventoryDates() {
		return inventoryDates;
	}

	public void setInventoryDates(String inventoryDates) {
		this.inventoryDates = inventoryDates;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (paymentId != null ? paymentId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Payment)) {
			return false;
		}
		Payment other = (Payment) object;
		if ((this.paymentId == null && other.paymentId != null)
				|| (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "reservation.pojo.Payment[ paymentId=" + paymentId + " ]";
	}

}
