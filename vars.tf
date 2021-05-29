variable size {
  description = "Instance size (type will be t2)."
  default     = "micro"
}

variable Name {
  description = "Name of the EC2 instance"
}

variable EndDate {
  description = "Date on which the resource can be auto-terminated"
}

variable BusinessUnit {
  description = "Businee Unit for which the resource is created for"
  default = "CTP-ENG-LAB"
}

variable user_id {
  description = "Mandatory argument which is used to tag the EC2"
}

