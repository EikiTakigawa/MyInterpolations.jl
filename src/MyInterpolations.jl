
module MyInterpolations

export MyLinInterp

struct MyLinInterp
    grid::Array{Real}
    vals::Array{Real}
end

function (f::MyLinInterp)(x::Real)
    if x < f.grid[1]
            y = ((f.vals[2]-f.vals[1])/(f.grid[2]-f.grid[1]))*(x-f.grid[1])+f.vals[1]
    elseif x >= f.grid[end]
         y = ((f.vals[end]-f.vals[end-1])/(f.grid[end]-f.grid[end-1]))*(x-f.grid[end-1])+f.vals[end-1]
    else
        i = searchsortedlast(f.grid, x)
        y = ((f.vals[i+1]-f.vals[i])/(f.grid[i+1]-f.grid[i]))*(x-f.grid[i])+f.vals[i]
    end
    return y
end

end
