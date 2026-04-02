Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4958A3E0257
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154920; cv=none; b=rOvhmZiUFsEu/siqVhttSnwTEAVjKrK8kSkEGIuFd6yxDiKSkNMwMLME0UWC9InG7y2RCE50X+ktZoy5s+fUQUOW2J1ucMIMVjFfjMvVEu+DObrv/L/8ESNzDe9J9If+Hjc7U1aOqi97Uq0tPsmlJHvC9Iwvy3zNALH51CJSppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154920; c=relaxed/simple;
	bh=zF80+M4APlEZNFZtle+CZkfRQZDU/mXX9mMK7hkebN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNGfkCvBKhLwFgaM95i9N/9kFxWREBvJAHf72BVnSRjv7E8I7axvFMO0P7bNirCg1d3x3Z4KXpBtmijDg2HaBGVGALyazGGWzenrjFXxZnclJtFPUE41uWIY0wW/ZfMT4xm49JbLAosfHLa02AfqTA8U8qCf1Kgz0lXDtwK8qRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYyUX9zb; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYyUX9zb"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9c3a9fe80fso152110966b.3
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154914; x=1775759714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=llaiNLI9W8RHcLnGNFknDTW7JCijLe/T2txvs0kR6f0=;
        b=rYyUX9zbF3tr8hw4xiTTHwauz7YCG7SNzxruCXugo2HabZX/41UF8q2jLX1/IwsABv
         s0CMpNa85TwoaG0DG6c6qwSY44TbdmS7Kojrctklt4yv6NPbhHa8xsFE5ZIOBb/tTZ6i
         6UYY6LnOGWiQlxlzvVAs8NKN5fynR/FK5p1ITg8JKVgMNY4WOT9CAICTVXFVYVLZzCB+
         9Wlukfqtu26YCMlavpeBraXpKeeFhdI0FMkyzs/RoNr3StWqkxS8UA5xom9SaT4Rhi3i
         fMYjX7sH/guS7OKRKzYgCO3O+cZB4Q6iDlRT1/8zotCAcZ2VJMtyb4d1M42q104brrOQ
         QPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154914; x=1775759714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llaiNLI9W8RHcLnGNFknDTW7JCijLe/T2txvs0kR6f0=;
        b=I13w/auWxvj24Dx6c0ZX88csGGU3TdjSzCga32f2lGb8sPhhnRjQP2XBb+npMLyqVW
         tcQdz5egwVGcouOls0fxLFc512CQ1xZxqkMiOSr4Y/NNfJzjzKKLLUExbfZpGpsCTikW
         yf+q6t3O7HslxX3Tv64vW6slJq/gwPOleAU0x/TlzstOayageVigLgjC9MuxzgTBfQ+C
         H6aIcpi13DkDm+7ll45vN111U8LqzGCC4j/4nGZGW9aUaxH/MXY61h1DAP1tXZp7/D+d
         96o4TjZWfD1czlkMF4HgiDt4JV+z28/RnuAZF7DurzVtx6InyviHBMwTkDEjq8oiTn5y
         TePg==
X-Forwarded-Encrypted: i=1; AJvYcCXUV9cYORicDR+CRBIiISYMrrO4r+aSvbec5c4MC9QFxMG5Ry3yhXl5b7xFGIXrt6sMCKGxUHxwkjtQOxBigAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0RRnm+ItLEL8T58BUS37VLDLbG6/i80kns/LNsTzM7Rc0E2a
	fSVGfU9MPL8fGJt965kiTb/1WXFekM58S7ldB9xQcKoNBW5sIUCCJ9R0
X-Gm-Gg: ATEYQzyx7rO6YniHvBkbDhbdnejwukN9ltaVrK/fpm0U8qofXa+agi9kR4+IfYjRqPI
	9TxvObcWmQ5zZ0mCfTAxZS4/zRUqDgVSkDNEd/i/6hunx0Tyw53vgVpL7LkFV9ep5tLKb7KdKOl
	jbciofrQ/u6Pz3ChFXkrYwwF5Z2nezL5reMK5QTTIG+a5p68ZCT/DNJgA/+K3ihhBDkcp15BTsK
	FnmpA95ybvN+GKoBrfJGCG//eTNR+0yduRhmKKsMFMefPY5yXeCP0YiDR07b5r/wmcRf5j5Pi7O
	/75aQBw7i97oiktB3Mi86Yfjz2XN46O45zZW1iyiVTFpx7FXJwn38/NOloRMnaE2dcS6jVkYuXp
	/TPQYY1YYLFaWRvXs9TR2pQ6N+dIcVDnmHyiV2WTriwq1F34Y/nNWUPd6yPhjnLWrMmTtpVmhOy
	Xr6ajGq+2O5ONlk1nHwAAjSjGsSKpUt5risCu1jteD+qlxZ3EHtFYRZCyrBGyhCstzmjQGvUfqN
	kDZIg==
X-Received: by 2002:a17:906:b291:b0:b9b:207c:f7af with SMTP id a640c23a62f3a-b9c13ca1a2emr504245766b.42.1775154913941;
        Thu, 02 Apr 2026 11:35:13 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:a75e:9a00:248c:6c47:3ce1:a121? ([2a02:a03f:a75e:9a00:248c:6c47:3ce1:a121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6cc4sm110785266b.32.2026.04.02.11.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:35:13 -0700 (PDT)
Message-ID: <d2b6a7fd-e09f-4e5d-838a-077ccecbd67f@gmail.com>
Date: Thu, 2 Apr 2026 20:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] selftests: seg6: add test for dst_cache
 isolation in seg6 lwtunnel
To: Andrea Mayer <andrea.mayer@uniroma2.it>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, dsahern@kernel.org,
 david.lebrun@uclouvain.be, stefano.salsano@uniroma2.it,
 paolo.lungaroni@uniroma2.it, nicolas.dichtel@6wind.com,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260401185755.29813-1-andrea.mayer@uniroma2.it>
 <20260401185755.29813-3-andrea.mayer@uniroma2.it>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20260401185755.29813-3-andrea.mayer@uniroma2.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 20:57, Andrea Mayer wrote:
> Add a selftest that verifies the dst_cache in seg6 lwtunnel is not
> shared between the input (forwarding) and output (locally generated)
> paths.
> 
> The test creates three namespaces (ns_src, ns_router, ns_dst)
> connected in a line. An SRv6 encap route on ns_router encapsulates
> traffic destined to cafe::1 with SID fc00::100. The SID is
> reachable only for forwarded traffic (from ns_src) via an ip rule
> matching the ingress interface (iif veth-r0 lookup 100), and
> blackholed in the main table.
> 
> The test verifies that:
> 
>    1. A packet generated locally on ns_router does not reach
>       ns_dst with an empty cache, since the SID is blackholed;
>    2. A forwarded packet from ns_src populates the input cache
>       from table 100 and reaches ns_dst;
>    3. A packet generated locally on ns_router still does not
>       reach ns_dst after the input cache is populated,
>       confirming the output path does not reuse the input
>       cache entry.
> 
> Both the forwarded and local packets are pinned to the same CPU
> with taskset, since dst_cache is per-cpu.
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Andrea Mayer <andrea.mayer@uniroma2.it>
> Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
> Changes v1 -> v2:
>   - fix SKIP message wording (Nicolas)
> ---
>   tools/testing/selftests/net/Makefile          |   1 +
>   .../selftests/net/srv6_iptunnel_cache.sh      | 177 ++++++++++++++++++
>   2 files changed, 178 insertions(+)
>   create mode 100755 tools/testing/selftests/net/srv6_iptunnel_cache.sh
> 
> diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
> index 605c54c0e8a3..c709523c99c6 100644
> --- a/tools/testing/selftests/net/Makefile
> +++ b/tools/testing/selftests/net/Makefile
> @@ -89,6 +89,7 @@ TEST_PROGS := \
>   	srv6_end_x_next_csid_l3vpn_test.sh \
>   	srv6_hencap_red_l3vpn_test.sh \
>   	srv6_hl2encap_red_l2vpn_test.sh \
> +	srv6_iptunnel_cache.sh \
>   	stress_reuseport_listen.sh \
>   	tcp_fastopen_backup_key.sh \
>   	test_bpf.sh \
> diff --git a/tools/testing/selftests/net/srv6_iptunnel_cache.sh b/tools/testing/selftests/net/srv6_iptunnel_cache.sh
> new file mode 100755
> index 000000000000..1f3ebb930eb2
> --- /dev/null
> +++ b/tools/testing/selftests/net/srv6_iptunnel_cache.sh
> @@ -0,0 +1,177 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# author: Andrea Mayer <andrea.mayer@uniroma2.it>
> +
> +# This test verifies that the seg6 lwtunnel does not share the dst_cache
> +# between the input (forwarding) and output (locally generated) paths.
> +#
> +# A shared dst_cache allows a forwarded packet to populate the cache and a
> +# subsequent locally generated packet to silently reuse that entry, bypassing
> +# its own route lookup. To expose this, the SID is made reachable only for
> +# forwarded traffic (via an ip rule matching iif) and blackholed for everything
> +# else. A local ping on ns_router must always hit the blackhole;
> +# if it succeeds after a forwarded packet has populated the
> +# cache, the bug is confirmed.
> +#
> +# Both forwarded and local packets are pinned to the same CPU with taskset,
> +# since dst_cache is per-cpu.
> +#
> +#
> +# +--------------------+                        +--------------------+
> +# |      ns_src        |                        |      ns_dst        |
> +# |                    |                        |                    |
> +# |  veth-s0           |                        |           veth-d0  |
> +# |  fd00::1/64        |                        |        fd01::2/64  |
> +# +-------|------------+                        +----------|---------+
> +#         |                                                |
> +#         |            +--------------------+              |
> +#         |            |     ns_router      |              |
> +#         |            |                    |              |
> +#         +----------->+ veth-r0   veth-r1  +<-------------+
> +#                      | fd00::2   fd01::1  |
> +#                      +--------------------+
> +#
> +#
> +# ns_router: encap (main table)
> +# +---------+---------------------------------------+
> +# | dst     | action                                |
> +# +---------+---------------------------------------+
> +# | cafe::1 | encap seg6 mode encap segs fc00::100  |
> +# +---------+---------------------------------------+
> +#
> +# ns_router: post-encap SID resolution
> +# +-------+------------+----------------------------+
> +# | table | dst        | action                     |
> +# +-------+------------+----------------------------+
> +# | 100   | fc00::100  | via fd01::2 dev veth-r1    |
> +# +-------+------------+----------------------------+
> +# | main  | fc00::100  | blackhole                  |
> +# +-------+------------+----------------------------+
> +#
> +# ns_router: ip rule
> +# +------------------+------------------------------+
> +# | match            | action                       |
> +# +------------------+------------------------------+
> +# | iif veth-r0      | lookup 100                   |
> +# +------------------+------------------------------+
> +#
> +# ns_dst: SRv6 decap (main table)
> +# +--------------+----------------------------------+
> +# | SID          | action                           |
> +# +--------------+----------------------------------+
> +# | fc00::100    | End.DT6 table 255 (local)        |
> +# +--------------+----------------------------------+
> +
> +source lib.sh
> +
> +readonly SID="fc00::100"
> +readonly DEST="cafe::1"
> +
> +readonly SRC_MAC="02:00:00:00:00:01"
> +readonly RTR_R0_MAC="02:00:00:00:00:02"
> +readonly RTR_R1_MAC="02:00:00:00:00:03"
> +readonly DST_MAC="02:00:00:00:00:04"
> +
> +cleanup()
> +{
> +	cleanup_ns "${NS_SRC}" "${NS_RTR}" "${NS_DST}"
> +}
> +
> +check_prerequisites()
> +{
> +	if ! command -v taskset &>/dev/null; then
> +		echo "SKIP: taskset not found"
> +		exit "${ksft_skip}"
> +	fi
> +}
> +
> +setup()
> +{
> +	setup_ns NS_SRC NS_RTR NS_DST
> +
> +	ip link add veth-s0 netns "${NS_SRC}" type veth \
> +		peer name veth-r0 netns "${NS_RTR}"
> +	ip link add veth-r1 netns "${NS_RTR}" type veth \
> +		peer name veth-d0 netns "${NS_DST}"
> +
> +	ip -n "${NS_SRC}" link set veth-s0 address "${SRC_MAC}"
> +	ip -n "${NS_RTR}" link set veth-r0 address "${RTR_R0_MAC}"
> +	ip -n "${NS_RTR}" link set veth-r1 address "${RTR_R1_MAC}"
> +	ip -n "${NS_DST}" link set veth-d0 address "${DST_MAC}"
> +
> +	# ns_src
> +	ip -n "${NS_SRC}" link set veth-s0 up
> +	ip -n "${NS_SRC}" addr add fd00::1/64 dev veth-s0 nodad
> +	ip -n "${NS_SRC}" -6 route add "${DEST}"/128 via fd00::2
> +
> +	# ns_router
> +	ip -n "${NS_RTR}" link set veth-r0 up
> +	ip -n "${NS_RTR}" addr add fd00::2/64 dev veth-r0 nodad
> +	ip -n "${NS_RTR}" link set veth-r1 up
> +	ip -n "${NS_RTR}" addr add fd01::1/64 dev veth-r1 nodad
> +	ip netns exec "${NS_RTR}" sysctl -qw net.ipv6.conf.all.forwarding=1
> +
> +	ip -n "${NS_RTR}" -6 route add "${DEST}"/128 \
> +		encap seg6 mode encap segs "${SID}" dev veth-r0
> +	ip -n "${NS_RTR}" -6 route add "${SID}"/128 table 100 \
> +		via fd01::2 dev veth-r1
> +	ip -n "${NS_RTR}" -6 route add blackhole "${SID}"/128
> +	ip -n "${NS_RTR}" -6 rule add iif veth-r0 lookup 100
> +
> +	# ns_dst
> +	ip -n "${NS_DST}" link set veth-d0 up
> +	ip -n "${NS_DST}" addr add fd01::2/64 dev veth-d0 nodad
> +	ip -n "${NS_DST}" addr add "${DEST}"/128 dev lo nodad
> +	ip -n "${NS_DST}" -6 route add "${SID}"/128 \
> +		encap seg6local action End.DT6 table 255 dev veth-d0
> +	ip -n "${NS_DST}" -6 route add fd00::/64 via fd01::1
> +
> +	# static neighbors
> +	ip -n "${NS_SRC}" -6 neigh add fd00::2 dev veth-s0 \
> +		lladdr "${RTR_R0_MAC}" nud permanent
> +	ip -n "${NS_RTR}" -6 neigh add fd00::1 dev veth-r0 \
> +		lladdr "${SRC_MAC}" nud permanent
> +	ip -n "${NS_RTR}" -6 neigh add fd01::2 dev veth-r1 \
> +		lladdr "${DST_MAC}" nud permanent
> +	ip -n "${NS_DST}" -6 neigh add fd01::1 dev veth-d0 \
> +		lladdr "${RTR_R1_MAC}" nud permanent
> +}
> +
> +test_cache_isolation()
> +{
> +	RET=0
> +
> +	# local ping with empty cache: must fail (SID is blackholed)
> +	if ip netns exec "${NS_RTR}" taskset -c 0 \
> +			ping6 -c 1 -W 2 "${DEST}" &>/dev/null; then
> +		echo "SKIP: local ping succeeded, topology broken"
> +		exit "${ksft_skip}"
> +	fi
> +
> +	# forward from ns_src to populate the input cache
> +	if ! ip netns exec "${NS_SRC}" taskset -c 0 \
> +			ping6 -c 1 -W 2 "${DEST}" &>/dev/null; then
> +		echo "SKIP: forwarded ping failed, topology broken"
> +		exit "${ksft_skip}"
> +	fi
> +
> +	# local ping again: must still fail; if the output path reuses
> +	# the input cache, it bypasses the blackhole and the ping succeeds
> +	if ip netns exec "${NS_RTR}" taskset -c 0 \
> +			ping6 -c 1 -W 2 "${DEST}" &>/dev/null; then
> +		echo "FAIL: output path used dst cached by input path"
> +		RET="${ksft_fail}"
> +	else
> +		echo "PASS: output path dst_cache is independent"
> +	fi
> +
> +	return "${RET}"
> +}
> +

We should check it runs as root here (e.g, required for netns creation).

if [ "$(id -u)" -ne 0 ]; then
	echo "SKIP: Need root privileges"
	exit "${ksft_skip}"
fi

Otherwise, LGTM:

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>

> +trap cleanup EXIT
> +
> +check_prerequisites
> +setup
> +test_cache_isolation
> +exit "${RET}"

