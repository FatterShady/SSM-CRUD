package com.wxr.crud.bean;

public class Department {
    public Department() {
    }

    public Department(Integer deptId, String deptName) {

        this.deptId = deptId;
        this.deptName = deptName;
    }

    private Integer deptId;

    private String deptName;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }
}