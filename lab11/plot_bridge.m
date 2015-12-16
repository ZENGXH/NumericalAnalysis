function [ fig_h ] = plot_bridge( nnodes, disp )
% PLOT_BRIDGE vizualize the configuration of the bridge and the deformed
% configuration according to the displacement field.
% Nodes numbering is from left to right.
%  [ fig_h ] = plot_bridge( nnodes, disp )
%  Inputs: nnodes = number of bridge nodes
%          disp   = column vector conatining the displacements in each node
%                   (ux_1,uy_1,..., ux_i, uy_i,...,ux_nnodes, uy_nnodes )^T
%                   optional input
%  Output: fig_h = figure handle
%


xy = zeros( nnodes, 1 );

xnodes = 0 : ( nnodes - 1 ) / 2;
xy( 1 : 2 : end, 1 ) = xnodes';
xy( 1 : 2 : end, 2 ) = zeros( length( xnodes ), 1 );

xnodes = xnodes( 1 : end - 1 ) + 0.5;
xy( 2 : 2 : end - 1, 1 ) = xnodes';
xy( 2 : 2 : end - 1, 2 ) = sqrt( 3 ) / 2 * ones( length( xnodes ), 1 );

fig_h = figure( 101 );
plot( xy( :, 1 ), xy( :, 2 ), '-ob', ...
       xy( 1 : 2 : end, 1 ), xy( 1 : 2 : end, 2 ), '-b', ... 
       xy( 2 : 2 : end - 1, 1 ), xy( 2 : 2 : end - 1, 2 ), '-b', ...
       'LineWidth', 1, 'MarkerFaceColor', 'b', 'MarkerSize', 10 );
   
grid on  
xlabel('x');
ylabel('y');
axis equal
FontSize = 15;
set( gca, 'FontSize', FontSize, 'FontName', 'TimesNewRoman' )
xlhand = get( gca, 'xlabel' );
set( xlhand, 'FontSize', FontSize, 'FontName', 'TimesNewRoman' )
ylhand = get( gca, 'ylabel' );
set( ylhand, 'FontSize', FontSize, 'FontName', 'TimesNewRoman' )
tlhand = get( gca, 'title' );
set( tlhand, 'FontSize', FontSize, 'FontName', 'TimesNewRoman' )


lref = ( nnodes - 1 ) / 2;
axis( [ - 0.1 * lref  1.1 * lref -0.15 * lref 0.2 * lref ] );

if nargin == 2
   hold on
   
   xy_disp = xy + [ disp( 1 : 2 : end - 1, 1 ), disp( 2 : 2 : end, 1 ) ];
   
   plot( xy_disp( :, 1 ), xy_disp( :, 2 ), '-or', ...
       xy_disp( 1 : 2 : end, 1 ), xy_disp( 1 : 2 : end, 2 ), '-r', ... 
       xy_disp( 2 : 2 : end - 1, 1 ), xy_disp( 2 : 2 : end - 1, 2 ), '-r', ...
       'LineWidth', 1, 'MarkerFaceColor', 'r', 'MarkerSize', 10 );    
   
   hold off
end


return