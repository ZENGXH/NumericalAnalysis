function [ A ] = bridge_stiffness_matrix( nnodes, KK )
% BRIDGE_STIFFNESS_MATRIX assemble the stiffness matrix for the bridge beam 
% model given the number of nodes of the bridge.
%  [ A ] = bridge_stiffness_matrix( nnodes, KK )
%  Inputs: nnodes = number of bridge nodes
%          KK     = dimensionless number representing the elastic
%                   properties of each beam
%  Output: A      = stifness matrix of size n x n, n = 2 nnodes; the matrix
%                   is in sparse format
%

nnodes = max( nnodes, 5 );
if ~( 2 * ( ceil( nnodes / 2 ) - nnodes / 2 ) )
    error( 'Number of bridge nodes must be odd');
end
    

n = 2 * nnodes; % total number of degrees of freedom, matrix size

% prepare matrix A
Ta = 1 / 4 * [ 1, sqrt( 3 ); sqrt( 3 ), 3 ];
Th = [ 1 0; 0 0 ];
Tb = 1 / 4 * [ 1, - sqrt( 3 ); - sqrt( 3 ), 3 ];

A = sparse( n, n );
% loop over nodes of the bridge
for k = 1 : nnodes
    
    bvect = [ max( 1, k - 2 ) : min( nnodes, k + 2 ) ];    
    
    lbv = length( bvect );
    
    av = [ ( 2 * k - 1 ) * ones( 1, 2 * lbv ); 2 * k * ones( 1, 2 * lbv ) ];
    bv = sort( [ 2 * bvect, 2 * bvect - 1 ] );  
    bv = [ bv; bv ];
    
    % values
    pp = 2 * ( ceil( k / 2 ) - k / 2 ); % 0 if k even, 1 if k odd      
    switch k
        % first node
        case 1
            sv = [ Th + Ta, - Ta, - Th ];    
        % second node       
        case 2
            sv = [ - Ta, Th + Ta + Tb, - Tb, -Th ];
        % last - 1 node    
        case ( nnodes - 1 )
            sv = [ - Th, - Ta, Th + Ta + Tb, - Tb ];
        % last node    
        case nnodes
            sv = [ - Th, - Tb, Th + Tb ];
        % else (even/odd)    
        otherwise
            sv = [ - Th, - Ta + pp * ( Ta - Tb ), ...
                   2 * Th + Ta + Tb, ...
                   - Tb + pp * ( Tb - Ta ), - Th ];                   
    end
   
    a = reshape( av, 1, 2 * 2 * lbv );
    b = reshape( bv, 1, 2 * 2 * lbv );
    s = KK * reshape( sv, 1, 2 * 2 * lbv );
    
    % assemble matrix
    A = A + sparse( a, b, s, n, n );
    
end

return