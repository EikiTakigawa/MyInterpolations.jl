
module MyInterpolations

export MyLinInterp

immutable MyLinInterp
    grid
    vals
end

function (f::MyLinInterp)(x)
    if x < f.grid[1]
            y = ((f.vals[2]-f.vals[1])/(f.grid[2]-f.grid[1]))*(x-f.grid[1])+f.vals[1]
            return y
    end
    if x >= f.grid[end]
         y = ((f.vals[end]-f.vals[end-1])/(f.grid[end]-f.grid[end-1]))*(x-f.grid[end-1])+f.vals[end-1]
        return y
    end
    if f.grid[1] <= x < f.grid[end]
        i = searchsortedlast(f.grid, x)
        y = ((f.vals[i+1]-f.vals[i])/(f.grid[i+1]-f.grid[i]))*(x-f.grid[i])+f.vals[i]
        return y
    end
end

end


