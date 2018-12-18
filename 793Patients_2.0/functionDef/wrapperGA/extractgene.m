function [ gene ] = extractgene(s,e,chrom )
%extractgene takes a substring starting at s and ending at e
% from chrom (i.e. extract a single gene - or a suibstring if you prefer)
% note it doesn't currently do any bounds checking
gene=zeros(1,e-s+1);
genepos=1;
for i=s : e
    gene(1,genepos)=chrom(i);
    genepos=genepos+1;
end




end

