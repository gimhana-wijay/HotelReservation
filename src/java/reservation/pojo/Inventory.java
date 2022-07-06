package reservation.pojo;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Gimhana Sandakelum
 */
@Entity
@Table(name = "inventory")
@NamedQueries({ @NamedQuery(name = "Inventory.findAll", query = "SELECT i FROM Inventory i"),
		@NamedQuery(name = "Inventory.findByInventoryId", query = "SELECT i FROM Inventory i WHERE i.inventoryId = :inventoryId"),
		@NamedQuery(name = "Inventory.findByInventoryFrom", query = "SELECT i FROM Inventory i WHERE i.inventoryFrom = :inventoryFrom"),
		@NamedQuery(name = "Inventory.findByInventoryTo", query = "SELECT i FROM Inventory i WHERE i.inventoryTo = :inventoryTo"),
		@NamedQuery(name = "Inventory.findByInventoryCount", query = "SELECT i FROM Inventory i WHERE i.inventoryCount = :inventoryCount"),
		@NamedQuery(name = "Inventory.findByInventoryDates", query = "SELECT i FROM Inventory i WHERE i.inventoryDates = :inventoryDates") })
public class Inventory implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "inventoryId")
	private Integer inventoryId;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 45)
	@Column(name = "inventory_from")
	private String inventoryFrom;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 100)
	@Column(name = "inventory_to")
	private String inventoryTo;
	@Basic(optional = false)
	@NotNull
	@Column(name = "inventory_count")
	private int inventoryCount;
	@Basic(optional = false)
	@NotNull
	@Size(min = 1, max = 100)
	@Column(name = "inventory_dates")
	private String inventoryDates;
	@JoinColumn(name = "roomId", referencedColumnName = "roomId")
	@ManyToOne(optional = false)
	private Room roomId;

	public Inventory() {
	}

	public Inventory(Integer inventoryId) {
		this.inventoryId = inventoryId;
	}

	public Inventory(Integer inventoryId, String inventoryFrom, String inventoryTo, int inventoryCount,
			String inventoryDates) {
		this.inventoryId = inventoryId;
		this.inventoryFrom = inventoryFrom;
		this.inventoryTo = inventoryTo;
		this.inventoryCount = inventoryCount;
		this.inventoryDates = inventoryDates;
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

	public int getInventoryCount() {
		return inventoryCount;
	}

	public void setInventoryCount(int inventoryCount) {
		this.inventoryCount = inventoryCount;
	}

	public String getInventoryDates() {
		return inventoryDates;
	}

	public void setInventoryDates(String inventoryDates) {
		this.inventoryDates = inventoryDates;
	}

	public Room getRoomId() {
		return roomId;
	}

	public void setRoomId(Room roomId) {
		this.roomId = roomId;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (inventoryId != null ? inventoryId.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof Inventory)) {
			return false;
		}
		Inventory other = (Inventory) object;
		if ((this.inventoryId == null && other.inventoryId != null)
				|| (this.inventoryId != null && !this.inventoryId.equals(other.inventoryId))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "reservation.pojo.Inventory[ inventoryId=" + inventoryId + " ]";
	}

}
