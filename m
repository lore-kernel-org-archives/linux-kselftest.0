From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 10 Jan 2019 15:59:32 +0100
Subject: [PATCH] selftests: bpf: install files tcp_(server|client)*.py
In-Reply-To: <20190108092303.12597-1-anders.roxell@linaro.org>
References: <20190108092303.12597-1-anders.roxell@linaro.org>
Message-ID: <c1bb1ee4-6138-04ab-f690-8c988501bda4@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190110145932.zY_HQyALUnjfocJPg8Hwl_egXzsbfv_z6oAfb57tm9s@z>

On 01/08/2019 10:23 AM, Anders Roxell wrote:
> When test_tcpbpf_user runs it complains that it can't find files
> tcp_server.py and tcp_client.py.
> 
> Rework so that tcp_server.py and tcp_client.py gets installed, added them
> to the variable TEST_PROGS_EXTENDED.
> 
> Fixes: d6d4f60c3a09 ("bpf: add selftest for tcpbpf")
> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>

Applied to bpf, thanks!
