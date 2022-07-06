package reservation.pojo;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

/**
 *
 * @author Gimhana Sandakelum
 */
@Entity
@Table(name = "hotel")
@NamedQueries({ @NamedQuery(name = "Hotel.findAll", query = "SELECT h FROM Hotel h"),
		@NamedQuery(name = "Hotel.findByHotelId", query = "SELECT h FROM Hotel h WHERE h.hotelId = :hotelId"),
		@NamedQuery(name = "Hotel.findByName", query = "SELECT h FROM Hotel h WHERE h.name = :name"),
		@NamedQuery(name = "Hotel.findByAddress", query = "SELECT h FROM Hotel h WHERE h.address = :address"),
		@NamedQuery(name = "Hotel.findByDescreption", query = "SELECT h FROM Hotel h WHERE h.descreption = :descreption"),
		@NamedQuery(name = "Hotel.findByPhone", query = "SELECT h FROM Hotel h WHERE h.phone = :phone"),
		@NamedQuery(name = "Hotel.findByEmail", query = "SELECT h FROM Hotel h WHERE h.email = :email"),
		@NamedQuery(name = "Hotel.findByStar", query = "SELECT h FROM Hotel h WHERE h.star = :star"),
		@NamedQuery(name = "Hotel.findByEnabled", query = "SELECT h FROM Hotel h WHERE h.enabled = :enabled") })
public class Hotel implements Serializable {

	@Size(max = 100)
	@Column(name = "location")
	private String location;

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "hotelId")
	private Integer hotelId;
	@Size(max = 45)
	@Column(name = "name")
	private String name;
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
	@Column(name = "star")
	private String star;
	@Size(max = 1)
	@Column(name = "enabled")
	private String enabled;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "hotelId")
	private Set<Room> roomSet;

	public Hotel() {
	}

	public Hotel(Integer hotelId) {
		this.hotelId = hotelId;
	}

	public Integer getHotelId() {
		return hotelId;
	}

	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public Set<Room> getRoomSet() {
		return roomSet;
	}

	public void setRoomSet(Set<Room> roomSet) {
		this.roomSet = roomSet;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (hotelId != null ? hotelId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Hotel)) {
			return false;
		}
		Hotel other = (Hotel) object;
		if ((this.hotelId == null && other.hotelId != null)
				|| (this.hotelId != null && !this.hotelId.equals(other.hotelId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "reservation.pojo.Hotel[ hotelId=" + hotelId + " ]";
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}
