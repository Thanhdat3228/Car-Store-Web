package model;

public class CarSpecs {
    private int id;
    private int carId;            // liên kết với bảng cars
    private int seatCount;        // số chỗ ngồi
    private String dimensions;    // dài x rộng x cao
    private String wheelType;     // loại mâm/lốp
    private int weight;           // tự trọng/tải trọng
    private int groundClearance;  // khoảng sáng gầm xe (mm)
    private String engine;        // loại động cơ
    private String fuelType;      // loại nhiên liệu

    public CarSpecs() {}

    public CarSpecs(int id, int carId, int seatCount, String dimensions, String wheelType,
                    int weight, int groundClearance, String engine, String fuelType) {
        this.id = id;
        this.carId = carId;
        this.seatCount = seatCount;
        this.dimensions = dimensions;
        this.wheelType = wheelType;
        this.weight = weight;
        this.groundClearance = groundClearance;
        this.engine = engine;
        this.fuelType = fuelType;
    }

    // --- Getter & Setter ---
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getCarId() {
        return carId;
    }
    public void setCarId(int carId) {
        this.carId = carId;
    }

    public int getSeatCount() {
        return seatCount;
    }
    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }

    public String getDimensions() {
        return dimensions;
    }
    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public String getWheelType() {
        return wheelType;
    }
    public void setWheelType(String wheelType) {
        this.wheelType = wheelType;
    }

    public int getWeight() {
        return weight;
    }
    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getGroundClearance() {
        return groundClearance;
    }
    public void setGroundClearance(int groundClearance) {
        this.groundClearance = groundClearance;
    }

    public String getEngine() {
        return engine;
    }
    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getFuelType() {
        return fuelType;
    }
    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }
}