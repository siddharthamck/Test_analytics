# Papermill notebook usage - playbook

## Data 
1. Make the input data available as a folder location, for example by mounting it to a location thats accessible to the papermill notebook
2. Once the data is available in the folder `examples/computer/analytics_data` 
3. In normal usage, the data would be one of the inputs to the papermill notebooks 
4. Any data format readable by Python libraries can be used

### Generated Data 
The notebooks may generate datasets as a result of their execution. The paths where the datasets are generated may be passed as notebook parameters. 

## Parameters 
1. The parameters file provides named parameters to the papermill notebook
2. Under normal usage, several of the named parameters could be peaths to datasets, such as CSV files.  
3. In addition, you may also have several parameters which define the inputs to the analytics process 
4. If your notebook expects the dataset in the previous section in the parameter `input_path`, you would need to define the parameter `input_path` in the respective parameters file that is used for invoking the notebook


## Notebooks
The notebooks is where most of the computational logic is defined. Define your notebooks under the `examples/computer' folder`


## Developing the notebooks 
To develop a callable notebook in
Papermill, follow the following steps. 
1. To use parameters for development and testing, define the notebook paremetrs by tagging the cell 
2. When the notebook is called in a standalone manner, the parameters are injected by the caller. 
3. For example if you have two parameters `path` and `threshold`, and you would like to use the followig values for development and testing - 
```
input_path = 'examples/computer/analytics_data'
threshold = 0.5
```

You will start by defining the parameters as above in a regular jupyter cell, and then tag the jupyter notebook using the Jupyter menu View -> Cell Toolbar -> Tags.
Following this, continue developing the Jupyter notebook as usual.  

## Defining the notebook parameters
To run the notebook defined above with a different set of parameters update the parameter file `params.yaml`, as shown below - 
```
input_path: 'examples/computer/more_analytics_data'
threshold = 0.75
``` 
When the papermill notebook is run, papermill will 
1. Create a copy of the notebook
2. Inject the above parameters into the copy of the notebook
3. Execute the notebook
4. Save the final state of the notebook

Any datasets that are generated as a result of this execution should be saved by the in an appropriate location. The paths to the location where the datasets are saved may be passed as parameters. 


## Running the notebooks
In order to run the notebook through papermill, you need the parameters YAML file, the papermill notebook and the path to the file where the copy of the executed notebook is saved. 

## Testing the notebooks
For testing we use the  




