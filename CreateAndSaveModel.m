function CreateAndSaveModel

   I= [60,  63, 65, 68, 70, 74, 76, 78, 82, 85, 88, 90, 92, 94, 95, 100, 102, 105, 109, 110];
   J= [5,   6,  6,  7,  7,  7,  10,  8,  7,  10, 12, 14,  15,  20, 20,  20,  11,  15,   17, 20];
   h= [5,   6,  5,  4,  6,  7,  7,  7,  8,  7,  8,  8,  6,  6,  8, 8, 9, 7, 6, 5];
   hh=[6,   8,  9,  8,  9,  9,  9,  12,  10, 7,  11, 12,  11,  10,  9, 10, 10, 9, 11, 9];
   nmodel=numel(I);
   
   for k=1:nmodel
        
        model=CreateRandomModel(I(k),J(k),h(k),hh(k));
        modelName=['LRP_' num2str(model.I) 'X' num2str(model.J)];
        save(modelName,'model');
   end 
    

end




