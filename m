From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 9 Nov 2018 11:23:09 +0100
Subject: [PATCH v2] kselftests/bpf: use ping6 as the default ipv6 ping
 binary when it exists
In-Reply-To: <1541408268-11256-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1541408268-11256-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <46d1890b-26a0-7ca4-16e8-4704ec12692f@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181109102309.vuC1pL8Tsxj8HbrHyLP8XuwG9TBPNZGLAGUJaW6j9Ko@z>

On 11/05/2018 09:57 AM, Li Zhijian wrote:
> At commit deee2cae27d1 ("kselftests/bpf: use ping6 as the default ipv6 ping
> binary if it exists"), it fixed similar issues for shell script, but it
> missed a same issue in the C code.
> 
> Fixes: 371e4fcc9d96 ("selftests/bpf: cgroup local storage-based network counters")
> CC: Philip Li <philip.li at intel.com>
> Reported-by: kernel test robot <rong.a.chen at intel.com>
> Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>

Applied to bpf, thanks Li!
