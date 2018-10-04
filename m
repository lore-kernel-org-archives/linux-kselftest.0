From: shuah@kernel.org (Shuah Khan)
Date: Thu, 4 Oct 2018 13:18:01 -0600
Subject: [PATCH backport for 4.18] rseq/selftests: fix parametrized test
 with -fpie
In-Reply-To: <20181004190430.812-1-mathieu.desnoyers@efficios.com>
References: <20181004190430.812-1-mathieu.desnoyers@efficios.com>
Message-ID: <dccfbfa9-8844-7763-a85d-b30c99cb270b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181004191801.RgytDkGO2CicwFuQ0IvpGs1cc0-msYRRomDI7kdla6E@z>

On 10/04/2018 01:04 PM, Mathieu Desnoyers wrote:
> commit ce01a1575f45bf319e374592656441021a7f5823 upstream.
> 
> On x86-64, the parametrized selftest code for rseq crashes with a
> segmentation fault when compiled with -fpie. This happens when the
> param_test binary is loaded at an address beyond 32-bit on x86-64.
> 
> The issue is caused by use of a 32-bit register to hold the address
> of the loop counter variable.
> 
> Fix this by using a 64-bit register to calculate the address of the
> loop counter variables as an offset from rip.
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers at efficios.com>
> Acked-by: "Paul E . McKenney" <paulmck at linux.vnet.ibm.com>

Thanks for q quick back-port.

Acked-by:  Shuah Khan (Samsung OSG) <shuah at kernel.org>

thanks,
-- Shuah
