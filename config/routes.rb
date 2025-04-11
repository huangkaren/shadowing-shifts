Rails.application.routes.draw do

# Routes for the Shifts resource:

  # CREATE
  post("/insert_shift", { :controller => "shifts", :action => "create" })
          
  # READ
  get("/shifts", { :controller => "shifts", :action => "index" })
  
  get("/shifts/:path_id", { :controller => "shifts", :action => "shift" })
  
  # UPDATE
  
  post("/modify_shift/:path_id", { :controller => "shifts", :action => "update" })
  
  # DELETE
  get("/delete_shift/:path_id", { :controller => "shifts", :action => "destroy" })
  
end
