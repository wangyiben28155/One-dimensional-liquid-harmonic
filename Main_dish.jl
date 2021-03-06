module Liquid_Harmonic                                                  # 主模块

export what

using Distributions, Random
import Base.@kwdef

const L, num, particle, time = (10, 1000, 100, 8)                   #L:空间的范围, num:空间划分的格点数, particle:粒子数, time:改变的次数

abstract type AbstractDatalist{T <: AbstractFloat,V <: Integer} end

@kwdef struct Parameter{T,V} <: AbstractDatalist{T,V}                   # 这个后面的参数名称一定要与想要限定的类型参数是一致的
    Distr::Truncated = Truncated(Normal(0, 10), -10, 10)                # 这里使用截断正态分布来初始化撒点所用的分布, 用于后续生成
    Space::Vector{T} = collect(LinRange(-L, L, num))                    # 这个是用来初始化后面的势能函数的, 撒点得到的值不必在格点上

end

@kwdef mutable struct Liquid{T, V}  <: AbstractDatalist{T,V}
    location::Matrix{T} = zeros(T,(particle, time))
    Potential::Matrix{T} = zeros((num, time))

end


end