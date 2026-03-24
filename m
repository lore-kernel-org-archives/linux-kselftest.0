Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744953FF88E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 14:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362530; cv=none; b=SMwuuYWQ2Ri1XYKcv4b/IKob6yoK+nfLIjwtkdMAAJQh16ScmSgYyIJElBfoxFNyNbDE3nGdp0O7o/6z6P6VvszmaEmIP8dB+Y2yug6oUsY4qrfN8xv2UIw7FvaKLSRK8s1NaXRR8S2tYyis/rU8y88AIKEo593vAs5RyfBcTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362530; c=relaxed/simple;
	bh=b/rSLm+JSL9O7xyejiHOg3TWG9OkyW6gswHLA1N2Mss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdafKrKGXKO86PwQ1FuUB2bjjHAavaR12hMdXyRd+Hj4y7V/aqe3FSvWUsB+Opme6KKFCJlWqZDnlPR64wNRcsqQHEC2YhF59CxexnJZjprcKZWpTqJkIjKlLbSvr3R8clrpstDymjI7DkoXJVgcSs7AC/s07E+xYWxdUxI5eVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsc4w8Lg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WFKX9jxq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsc4w8Lg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WFKX9jxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774362527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNfbRsM807OnlQg8lg9RLA7MB5nNF7l6QlXbQnTvGiw=;
	b=gsc4w8LgYBuOv65/qoqWrJQ6xE2ueuiRPmxYSvjT7wLpuIR01gwnUdV2zUchJEJCAbx7BS
	em2DnGTGzT/puSsL6074yYqheb2gfzFWZ21cOzLiZflX22PoxlSlIglN+h2rKeFkIX+JoP
	w+HSd7BtsoMwy7aw99L5xm5PwtCQv6I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-AgXpP4odOUqxbLl3JSqEVQ-1; Tue, 24 Mar 2026 10:28:46 -0400
X-MC-Unique: AgXpP4odOUqxbLl3JSqEVQ-1
X-Mimecast-MFC-AGG-ID: AgXpP4odOUqxbLl3JSqEVQ_1774362525
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43b86de58d9so352921f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774362525; x=1774967325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNfbRsM807OnlQg8lg9RLA7MB5nNF7l6QlXbQnTvGiw=;
        b=WFKX9jxqHp/nymXnXbHvcp76UjCDBazB8KJznQhYg7eh75Y61S1DtxQ1mzVrin8Ptl
         YWZ4EG6hQsAtoNlp3EIItX5APt1H7PJs9Z8bG7IQbLHhJydSJilou9H26+5fe8lGbDTl
         kbUwUzdt76dPPHz6UafHrWl8hHfsbr4a0nLRp9iko7gZP+anOZN24Be46ijbdlk5K9l/
         ijIQ1uvfInred1ihsCJw2xqWhiJA9XdSTYJS+D/bg/c6bgjs7iKRAZkE2zSv744A3n09
         ibiAUiTbug0hmNNnzGv6kFyb96frwhQYcgebJgJOaYJQgcspEb6Ysjuv5hUyYR3EMD0W
         V+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362525; x=1774967325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNfbRsM807OnlQg8lg9RLA7MB5nNF7l6QlXbQnTvGiw=;
        b=hnk1ekRBwcX8hVgjgJMYdl6+a5W6mBWWQch0kc9Hz1YVCEpQ1kA7XumQjR3KQiJhQt
         a8x1EATuPmoCANETxNXjFc4U2h87V5JBaKXvlK0iHWX2fkMkkRAnuBNiiQ8XzxzeQImr
         MsaAyP3WtiXKglXP98GZfO/EZpxcsz2+7n3TSUec1+lKRMIcjUeD5vObx7thK3vCJYQ8
         IjJEdBBeIktOPfnA4mX63sfxKRgiAmuj46lLM6Vc8iah8ebbkFyJddoWWIitHytrakJ7
         GUoCISZSf3qoPCAQF+XJk+81eroTL5++BkAPO0ieQ4jN6KF7KI6g/Z3VHCNT1BJ4+1PH
         avyw==
X-Forwarded-Encrypted: i=1; AJvYcCVGFWevUsgp0FJws+LG0bCEQmX9MMlKOpKSROUcYKnuM6rWR+MUsglGw28EX6N66ebFRi56IWno9ZVjuBKa0Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+oRYiFYtxENMcZKDNr9PmMHnCUQRbfZde1rH357IdjKoKtHvP
	PKrvMbMMTyw7c7X1bi3JxhxMa6HdNN3jWXu69ON3Dypv0c7jZKqA4m9X8TnvNsMfRWkoneu+Xf2
	whwNqlAy+qhmTlgVyhi9TelaZiS9/deat1usQ8IdLPF+ZhSbL4UgynGjeWWbKsBiiryyNGA==
X-Gm-Gg: ATEYQzzvxvsyoMPyth9R/Z5Xi3hQTLXvz8wgNJkg3mrEL0ih7SGd9heTUzNdN+GjD4p
	u9ds9GsHZE5rKuOZxYNKK2u15sOvxk7QWgcifZvToRGoaNGI7niq81cIRd8tD6jsfxB3fGbuUST
	y5v1WNouwwC3fzYpmcDvbtHYmAykUH50/dsQRg+/grJkY9kbEe2+WypPAL9DVENy2q5ezkxBoHT
	oZtI4oHmf9MZzpoQQmFXxR55kbfrcM6V1PgaEigLR+CB+kkqDQ/kJi6VNtS+m16koHekDEuoG24
	VRSe6KKNc6n7yV/SyTYsE3dfya5qld649+o4B/ruswC+vEKulo3ssAz37jdctJF6wdDYzD6Oofo
	zS9VDc6RgPXxfe2sLJA70nnvHO7duJ1flENLfI4OyYRh5GnL5vCCtgOxp
X-Received: by 2002:a5d:5f86:0:b0:43b:4921:8743 with SMTP id ffacd0b85a97d-43b6428168dmr25521547f8f.42.1774362524588;
        Tue, 24 Mar 2026 07:28:44 -0700 (PDT)
X-Received: by 2002:a5d:5f86:0:b0:43b:4921:8743 with SMTP id ffacd0b85a97d-43b6428168dmr25521496f8f.42.1774362523935;
        Tue, 24 Mar 2026 07:28:43 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm38575836f8f.27.2026.03.24.07.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:28:43 -0700 (PDT)
Message-ID: <51b1b736-17b4-4e2e-b11a-3d94c8410a9c@redhat.com>
Date: Tue, 24 Mar 2026 15:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] selftests: net: add tests for PPP
To: Qingfang Deng <dqfext@gmail.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org
Cc: Paul Mackerras <paulus@ozlabs.org>
References: <20260321154616.2754-1-dqfext@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260321154616.2754-1-dqfext@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/21/26 4:46 PM, Qingfang Deng wrote:
> Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> 
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> ---
> v2: fix shellcheck and add trailing backslashes.
>  - https://lore.kernel.org/netdev/20260320071755.483733-1-dqfext@gmail.com/
> 
>  MAINTAINERS                                   |  1 +
>  tools/testing/selftests/Makefile              |  1 +
>  tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
>  tools/testing/selftests/net/ppp/config        |  8 ++++
>  tools/testing/selftests/net/ppp/ppp_async.sh  | 37 ++++++++++++++++
>  tools/testing/selftests/net/ppp/ppp_common.sh | 42 +++++++++++++++++++
>  .../selftests/net/ppp/pppoe-server-options    |  2 +
>  tools/testing/selftests/net/ppp/pppoe.sh      | 36 ++++++++++++++++
>  8 files changed, 142 insertions(+)
>  create mode 100644 tools/testing/selftests/net/ppp/Makefile
>  create mode 100644 tools/testing/selftests/net/ppp/config
>  create mode 100755 tools/testing/selftests/net/ppp/ppp_async.sh
>  create mode 100644 tools/testing/selftests/net/ppp/ppp_common.sh
>  create mode 100644 tools/testing/selftests/net/ppp/pppoe-server-options
>  create mode 100755 tools/testing/selftests/net/ppp/pppoe.sh
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a09bf30a057d..d553437d5ac1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21078,6 +21078,7 @@ PPP PROTOCOL DRIVERS AND COMPRESSORS
>  L:	linux-ppp@vger.kernel.org
>  S:	Orphan
>  F:	drivers/net/ppp/ppp_*
> +F:	tools/testing/selftests/net/ppp/
>  
>  PPS SUPPORT
>  M:	Rodolfo Giometti <giometti@enneenne.com>
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 450f13ba4cca..65f84e8a0cf0 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -78,6 +78,7 @@ TARGETS += net/netfilter
>  TARGETS += net/openvswitch
>  TARGETS += net/ovpn
>  TARGETS += net/packetdrill
> +TARGETS += net/ppp
>  TARGETS += net/rds
>  TARGETS += net/tcp_ao
>  TARGETS += nolibc
> diff --git a/tools/testing/selftests/net/ppp/Makefile b/tools/testing/selftests/net/ppp/Makefile
> new file mode 100644
> index 000000000000..b39b0abadde6
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +top_srcdir = ../../../../..
> +
> +TEST_PROGS := \
> +	ppp_async.sh \
> +	pppoe.sh \
> +# end of TEST_PROGS
> +
> +TEST_FILES := \
> +	ppp_common.sh \
> +	pppoe-server-options \
> +# end of TEST_FILES
> +
> +include ../../lib.mk
> diff --git a/tools/testing/selftests/net/ppp/config b/tools/testing/selftests/net/ppp/config
> new file mode 100644
> index 000000000000..7053aa9d8d74
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/config
> @@ -0,0 +1,8 @@
> +CONFIG_PACKET=y
> +CONFIG_PPP=m
> +CONFIG_PPP_ASYNC=m
> +CONFIG_PPP_BSDCOMP=m
> +CONFIG_PPP_DEFLATE=m
> +CONFIG_PPPOE=m
> +CONFIG_PPPOE_HASH_BITS_4=y
> +CONFIG_TTY=y

The config list looks quite tiny. Have you double-checked that it's
enough to run successfully the self-tests via the nipa-like setup:

https://github.com/linux-netdev/nipa/wiki/How-to-run-netdev-selftests-CI-style

?

> diff --git a/tools/testing/selftests/net/ppp/ppp_async.sh b/tools/testing/selftests/net/ppp/ppp_async.sh
> new file mode 100755
> index 000000000000..5c0eb84945e8
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/ppp_async.sh
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +source ppp_common.sh
> +
> +# Temporary files for PTY symlinks
> +TTY_SERVER=$(mktemp -u /tmp/ppp_async_server.XXXXXX)
> +TTY_CLIENT=$(mktemp -u /tmp/ppp_async_client.XXXXXX)

You need to delete the above files at cleanup time

> +
> +cleanup() {
> +	cleanup_all_ns
> +	[ -n "$SOCAT_PID" ] && kill "$SOCAT_PID" 2>/dev/null || true
> +}
> +
> +trap cleanup EXIT
> +
> +require_command socat
> +ppp_common_init
> +
> +# Create the virtual serial device
> +socat -d PTY,link="$TTY_SERVER",rawer PTY,link="$TTY_CLIENT",rawer &
> +SOCAT_PID=$!
> +
> +# Wait for symlinks to be created
> +slowwait 5 [ -L "$TTY_SERVER" ]
> +
> +# Start the PPP Server
> +ip netns exec "$NS_SERVER" pppd "$TTY_SERVER" 115200 \
> +	"$IP_SERVER":"$IP_CLIENT" \
> +	local noauth nodefaultroute debug
> +
> +# Start the PPP Client
> +ip netns exec "$NS_CLIENT" pppd "$TTY_CLIENT" 115200 \
> +	local noauth updetach nodefaultroute debug
> +
> +ppp_test_connectivity
> diff --git a/tools/testing/selftests/net/ppp/ppp_common.sh b/tools/testing/selftests/net/ppp/ppp_common.sh
> new file mode 100644
> index 000000000000..9ddfba0f9a05
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/ppp_common.sh
> @@ -0,0 +1,42 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# shellcheck disable=SC2153
> +
> +source ../lib.sh
> +
> +IP_SERVER="192.168.200.1"
> +IP_CLIENT="192.168.200.2"
> +
> +ppp_common_init() {
> +	# Package requirements
> +	require_command pppd
> +	require_command iperf3
> +
> +	# Check for root privileges
> +	if [ "$(id -u)" -ne 0 ];then
> +		echo "SKIP: Need root privileges"
> +		exit $ksft_skip
> +	fi
> +
> +	# Namespaces
> +	setup_ns NS_SERVER NS_CLIENT
> +}
> +
> +ppp_check_addr() {
> +	dev=$1
> +	addr=$2
> +	ns=$3
> +	ip -netns "$ns" -4 addr show dev "$dev" 2>/dev/null | grep -q "$addr"
> +	return $?
> +}
> +
> +ppp_test_connectivity() {
> +	slowwait 10 ppp_check_addr "ppp0" "$IP_CLIENT" "$NS_CLIENT"
> +
> +	ip netns exec "$NS_CLIENT" ping -c 3 "$IP_SERVER"
> +
> +	ip netns exec "$NS_SERVER" iperf3 -s -1 -D
> +	wait_local_port_listen "$NS_SERVER" 5201 tcp
> +
> +	ip netns exec "$NS_CLIENT" iperf3 -c "$IP_SERVER" -Z -t 2

It would be possibly helpful to let the test emit a one line test
name/description followed by [ ok ] / [fail] as most test cases currently do

/P

