function a=tri(r)
   for k=1:length(r)
       if k==1
          M(k,1)=1;
          M(k,2)=-2;
          M(k,3)=1;
       elseif k==length(r)
          M(k,length(r)-2)=1;
          M(k,length(r)-1)=-2;
          M(k,length(r))=1;
       else
          M(k,k-1)=1;
          M(k,k)=4;
          M(k,k+1)=1;
       end
   end
   a=M\r;
end