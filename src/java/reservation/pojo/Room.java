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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Gimhana Sandakelum
 */
@Entity
@Table(name = "room")
@NamedQueries({ @NamedQuery(name = "Room.findAll", query = "SELECT r FROM Room r"),
		@NamedQuery(name = "Room.findByRoomId", query = "SELECT r FROM Room r WHERE r.roomId = :roomId"),
		@NamedQuery(name = "Room.findByRoomCode", query = "SELECT r FROM Room r WHERE r.roomCode = :roomCode"),
		@NamedQuery(name = "Room.findByRoomType", query = "SELECT r FROM Room r WHERE r.roomType = :roomType"),
		@NamedQuery(name = "Room.findByBedType", query = "SELECT r FROM Room r WHERE r.bedType = :bedType"),
		@NamedQuery(name = "Room.findByRoomEnabled", query = "SELECT r FROM Room r WHERE r.roomEnabled = :roomEnabled") })
public class Room implements Serializable {

	@Basic(optional = false)
	@NotNull
	@Column(name = "room_price")
	private long roomPrice;

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "roomId")
	private Integer roomId;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 45)
	@Column(name = "room_code")
	private String roomCode;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 45)
	@Column(name = "room_type")
	private String roomType;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 45)
	@Column(name = "bed_type")
	private String bedType;
	@Size(max = 1)
	@Column(name = "room_enabled")
	private String roomEnabled;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "roomId")
	private Set<Inventory> inventorySet;
	@JoinColumn(name = "hotelId", referencedColumnName = "hotelId")
	@ManyToOne(optional = false)
	private Hotel hotelId;

	public Room() {
	}

	public Room(Integer roomId) {
		this.roomId = roomId;
	}

	public Room(Integer roomId, String roomCode, String roomType, String bedType) {
		this.roomId = roomId;
		this.roomCode = roomCode;
		this.roomType = roomType;
		this.bedType = bedType;
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

	public Set<Inventory> getInventorySet() {
		return inventorySet;
	}

	public void setInventorySet(Set<Inventory> inventorySet) {
		this.inventorySet = inventorySet;
	}

	public Hotel getHotelId() {
		return hotelId;
	}

	public void setHotelId(Hotel hotelId) {
		this.hotelId = hotelId;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (roomId != null ? roomId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Room)) {
			return false;
		}
		Room other = (Room) object;
		if ((this.roomId == null && other.roomId != null)
				|| (this.roomId != null && !this.roomId.equals(other.roomId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "reservation.pojo.Room[ roomId=" + roomId + " ]";
	}

	public long getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(long roomPrice) {
		this.roomPrice = roomPrice;
	}

}
