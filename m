Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EF13CB2F9
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085675; cv=none; b=duras8q2a4T2pE/AnnDGaCRHo5y/o6kmiEMaqjy2uI7TzPPsNGpxwZ96H0FdtbXiZmBe8dYUDOynfcRfQ3s0PWFN6sFdmfWJeVpQOJj5gB4vYtMmLUjc8EUg97EP5uh4b/Xs+KjIeHgQ9qMxymvZryZiW4ZorhzjbmwVWnkU95Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085675; c=relaxed/simple;
	bh=fKct7ZztpLkK81UctdEyquJ8z67KVVvUvQd9x3MdpW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hj7AqjRaAe5YYl88ILRTXX2Wm/vBwbQEDoIVcwwcE/FESH0jyeK0ECkEyZqIbfpUV+ZmZSAN4PoKtd0+YEehU6w8YUBomwFsLEcae2w3ZMsrUcrrGorp1oY09McZzIjEjxJjk6UNfasZiHwIHqX2A8ZtL+UUI4UZUdtkP6L/HIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJNp0Twc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FH33WQMo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJNp0Twc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FH33WQMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776085673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KM0BBgRU+pftKJ7no9VQ+2lJcIqOrqXp38LbkMWMNc=;
	b=bJNp0Twc82juSRxYehAMkgTB2URBDR0aYY2ijetWFSs9PxsnTTn9QgWQCwCNI9mPu6C1y6
	DryWZuOFuLO5btzXbqqD4PhpQlkov02u1xZYoA52/+aUJ0tUlII1uJNJSX43XTRtqe6Skt
	j1u722DzHwUxGJgQjGtKIQ6/5DQspm4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-4K-dKtl3Og6HNcn5EQVJOg-1; Mon, 13 Apr 2026 09:07:47 -0400
X-MC-Unique: 4K-dKtl3Og6HNcn5EQVJOg-1
X-Mimecast-MFC-AGG-ID: 4K-dKtl3Og6HNcn5EQVJOg_1776085665
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d1bfbd219so3191067f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 06:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776085665; x=1776690465; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KM0BBgRU+pftKJ7no9VQ+2lJcIqOrqXp38LbkMWMNc=;
        b=FH33WQMot9TLxLjsUf8zmySOXqgtEdUhBsPXa/AV5aFtSqsiAw9dXpE7vZzzh8Dr32
         JIIagaXaMWHMpDU5CQMB9Pzy8ACMcgBGNUxWs4SSyCTqtXu17XTQSFOSLWWAHLLt2wnS
         u5VEmmeXeRA2Qzzq5c3WF7WS5anlI5MqqJ+Jf/G5KK9JbLxeuPYT0ZV7mTCHOU0FP9rx
         ugXsRqOGQp1acpZatjMU8LZFDcphatE4aCkHyRf0M/rAo5Wih1uSrIjM3JnGuChpJ2YV
         WpeCripOI43NoDugPvxzN+FRZTNHMInxZNSzuoqnvnX9DHVXDx8cty5wAIyvDkLcPoec
         PNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085665; x=1776690465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KM0BBgRU+pftKJ7no9VQ+2lJcIqOrqXp38LbkMWMNc=;
        b=na7Zc6PhamvK2OArvE+kve1Ysb5M+Y1iln/0BqZfELnhO/PFmR6W1DWVRBiObdbwYU
         MR/xGOIpXHym5ZEGxArdplvq5yJYFr9V5FyjlGPa35ozyVjeuYsEbDYM2fBmYVEOVvDh
         rbXWEQnlzieMOwlqgK3V4Tznx4he/agHlQUZeoDuZXOA/ifEepck66f7hNhy19TKNnti
         7DLdG5SWqpLMlzMZSu6DTi4hj9fUgjV65UKlKIeGctqddD5KQRm9WSGAoheM7Y2c9Dsd
         qjrIf5qYqCdSbGmDOncHHDith9/ZrxcGticTx6mSa2RM58cQyw9+NrY6vcL7JOZ7cOvm
         Uopw==
X-Forwarded-Encrypted: i=1; AFNElJ/IvROBGuzqk9uIv3wXOkjg2RzyFhwkpfd/XetAb7hzBJHhf2X166frmJDHJB1CZlQwLtGfoS+27fQAb1c/03M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPlK8zyJRN6Pzxoe7i5Iv0jg3Nhw82cwjMLRs3XNZoJeLfU+dd
	+KLeyH3R0+iCXk3RmdUdysWodAiYPxbzD2/z6+SEKdxnc2bOJdberrGznBHM8hON3UAcrU0P1JQ
	tBma2bMjgaFOSue7wVlcxCmrTw1+x8RExpc1isMII2BaW9WSnfotDMPWD03BZYDOVJykS5A==
X-Gm-Gg: AeBDieuZZ6l9u4pwpINbDR3e0f1rjgRxeo/XrATUEeTKiH52Bc735Y8lmQCU8c/hX7s
	hIdYQaQbbZOGngmsyhSBw1jkb51xye34zuQj66dVbmbfrIYLDNd0awqs/aAjOT8RFJHXEnbqCp3
	1KpoEv9opDkhfq+dd41e2S+iK5NYa53j9pAcXJUJ8/DT5KaP+aFHTc49LpiubT8pSOEH7oeFz7m
	nt7vsFLKvUCs/YIrOiAopLbJZLTsPxXzug9QQ8uhAMKmSW+nf/b20p174k/4OfsnJL5tZ4zAN4/
	3zDcBPlmJHr41lMtTlZIzGSNEestxKEdIvpfwRA+roJWIqhhDLStSf0uTgvQySbooRJJvofSTyp
	wZHQUT7PQo78s2nO+0BSu54S97M2QjyY8dXaIXNeJH4UU0TTrgVwfhAU0
X-Received: by 2002:a05:6000:400e:b0:43d:1c39:26fd with SMTP id ffacd0b85a97d-43d642dc79bmr19385394f8f.43.1776085665304;
        Mon, 13 Apr 2026 06:07:45 -0700 (PDT)
X-Received: by 2002:a05:6000:400e:b0:43d:1c39:26fd with SMTP id ffacd0b85a97d-43d642dc79bmr19385335f8f.43.1776085664718;
        Mon, 13 Apr 2026 06:07:44 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7c135fd6sm7534866f8f.28.2026.04.13.06.07.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 06:07:44 -0700 (PDT)
Message-ID: <50312bed-d054-4c19-a0eb-1ddc139005ca@redhat.com>
Date: Mon, 13 Apr 2026 15:07:42 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 05/10] selftests: net: Add test for enablement
 of ports with teamd
To: Marc Harvey <marcharvey@google.com>, Jiri Pirko <jiri@resnulli.us>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
 <20260409-teaming-driver-internal-v7-5-f47e7589685d@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-5-f47e7589685d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/26 4:59 AM, Marc Harvey wrote:
> There are no tests that verify enablement and disablement of team driver
> ports with teamd. This should work even with changes to the enablement
> option, so it is important to test.
> 
> This test sets up an active-backup network configuration across two
> network namespaces, and tries to send traffic while changing which
> link is the active one.
> 
> Also increase the team test timeout to 300 seconds, because gracefully
> killing teamd can take 30 seconds for each instance.
> 
> Signed-off-by: Marc Harvey <marcharvey@google.com>
> ---
> Changes in v7:
> - Increase test timeout to 300 seconds, since terminating teamd can
>   take 30 seconds during test cleanup.
> - Link to v6: https://lore.kernel.org/netdev/20260408-teaming-driver-internal-v6-5-e5bcdcf72504@google.com/
> 
> Changes in v6:
> - Remove manual changing of member port states to UP, not needed.
> - Link to v5: https://lore.kernel.org/netdev/20260406-teaming-driver-internal-v5-5-e8a3f348a1c5@google.com/
> 
> Changes in v5:
> - Make test wait for inactive link to stop receiving traffic after
>   setting it to inactive, since there was a race condition.
> - Change test teardown to try graceful shutdown first, then use
>   sigkill if needed.
> - Manually delete leftover teamd files during teardown.
> - Use tcpdump instead of checking rx counters.
> - Link to v4: https://lore.kernel.org/netdev/20260403-teaming-driver-internal-v4-5-d3032f33ca25@google.com/
> 
> Changed in v3:
> - Make test cleanup kill teamd instead of terminate.
> - Link to v2: https://lore.kernel.org/netdev/20260401-teaming-driver-internal-v2-5-f80c1291727b@google.com/
> 
> Changes in v2:
> - Fix shellcheck failures.
> - Remove dependency on net forwarding lib and pipe viewer tools.
> - Use iperf3 for tcp instead of netcat.
> - Link to v1: https://lore.kernel.org/all/20260331053353.2504254-6-marcharvey@google.com/
> ---
>  tools/testing/selftests/drivers/net/team/Makefile  |   1 +
>  tools/testing/selftests/drivers/net/team/settings  |   1 +
>  .../testing/selftests/drivers/net/team/team_lib.sh |  26 +++
>  .../drivers/net/team/teamd_activebackup.sh         | 246 +++++++++++++++++++++
>  tools/testing/selftests/net/lib.sh                 |  13 ++
>  5 files changed, 287 insertions(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
> index 777da2e0429e..dab922d7f83d 100644
> --- a/tools/testing/selftests/drivers/net/team/Makefile
> +++ b/tools/testing/selftests/drivers/net/team/Makefile
> @@ -7,6 +7,7 @@ TEST_PROGS := \
>  	options.sh \
>  	propagation.sh \
>  	refleak.sh \
> +	teamd_activebackup.sh \
>  	transmit_failover.sh \
>  # end of TEST_PROGS
>  
> diff --git a/tools/testing/selftests/drivers/net/team/settings b/tools/testing/selftests/drivers/net/team/settings
> new file mode 100644
> index 000000000000..694d70710ff0
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/team/settings
> @@ -0,0 +1 @@
> +timeout=300
> diff --git a/tools/testing/selftests/drivers/net/team/team_lib.sh b/tools/testing/selftests/drivers/net/team/team_lib.sh
> index 2057f5edee79..02ef0ee02d6a 100644
> --- a/tools/testing/selftests/drivers/net/team/team_lib.sh
> +++ b/tools/testing/selftests/drivers/net/team/team_lib.sh
> @@ -146,3 +146,29 @@ did_interface_receive()
>  		false
>  	fi
>  }
> +
> +# Return true if the given interface in the given namespace does NOT receive
> +# traffic over a 1 second period.
> +# Arguments:
> +#   interface - The name of the interface.
> +#   ip_address - The destination IP address.
> +#   namespace - The name of the namespace that the interface is in.
> +check_no_traffic()
> +{
> +	local interface="$1"
> +	local ip_address="$2"
> +	local namespace="$3"
> +	local rc
> +
> +	save_tcpdump_outputs "${namespace}" "${interface}"
> +	did_interface_receive "${interface}" "${ip_address}"
> +	rc=$?
> +
> +	clear_tcpdump_outputs "${interface}"
> +
> +	if [[ "${rc}" -eq 0 ]]; then
> +		return 1
> +	else
> +		return 0
> +	fi
> +}
> diff --git a/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
> new file mode 100755
> index 000000000000..2b26a697e179
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/team/teamd_activebackup.sh
> @@ -0,0 +1,246 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# These tests verify that teamd is able to enable and disable ports via the
> +# active backup runner.
> +#
> +# Topology:
> +#
> +#  +-------------------------+  NS1
> +#  |        test_team1       |
> +#  |            +            |
> +#  |      eth0  |  eth1      |
> +#  |        +---+---+        |
> +#  |        |       |        |
> +#  +-------------------------+
> +#           |       |
> +#  +-------------------------+  NS2
> +#  |        |       |        |
> +#  |        +-------+        |
> +#  |      eth0  |  eth1      |
> +#  |            +            |
> +#  |        test_team2       |
> +#  +-------------------------+
> +
> +export ALL_TESTS="teamd_test_active_backup"
> +
> +test_dir="$(dirname "$0")"
> +# shellcheck disable=SC1091
> +source "${test_dir}/../../../net/lib.sh"
> +# shellcheck disable=SC1091
> +source "${test_dir}/team_lib.sh"
> +
> +NS1=""
> +NS2=""
> +export NODAD="nodad"
> +PREFIX_LENGTH="64"
> +NS1_IP="fd00::1"
> +NS2_IP="fd00::2"
> +NS1_IP4="192.168.0.1"
> +NS2_IP4="192.168.0.2"
> +NS1_TEAMD_CONF=""
> +NS2_TEAMD_CONF=""
> +NS1_TEAMD_PID=""
> +NS2_TEAMD_PID=""
> +
> +while getopts "4" opt; do
> +	case $opt in
> +		4)
> +			echo "IPv4 mode selected."
> +			export NODAD=
> +			PREFIX_LENGTH="24"
> +			NS1_IP="${NS1_IP4}"
> +			NS2_IP="${NS2_IP4}"
> +			;;
> +		\?)
> +			echo "Invalid option: -${OPTARG}" >&2
> +			exit 1
> +			;;
> +	esac
> +done
> +
> +teamd_config_create()
> +{
> +	local runner=$1
> +	local dev=$2
> +	local conf
> +
> +	conf=$(mktemp)
> +
> +	cat > "${conf}" <<-EOF
> +	{
> +		"device": "${dev}",
> +		"runner": {"name": "${runner}"},
> +		"ports": {
> +			"eth0": {},
> +			"eth1": {}
> +		}
> +	}
> +	EOF
> +	echo "${conf}"
> +}
> +
> +# Create the network namespaces, veth pair, and team devices in the specified
> +# runner.
> +# Globals:
> +#   RET - Used by test infra, set by `check_err` functions.
> +# Arguments:
> +#   runner - The Teamd runner to use for the Team devices.
> +environment_create()
> +{
> +	local runner=$1
> +
> +	echo "Setting up two-link aggregation for runner ${runner}"
> +	echo "Teamd version is: $(teamd --version)"
> +	trap environment_destroy EXIT
> +
> +	setup_ns ns1 ns2
> +	NS1="${NS_LIST[0]}"
> +	NS2="${NS_LIST[1]}"
> +
> +	for link in $(seq 0 1); do
> +		ip -n "${NS1}" link add "eth${link}" type veth peer name \
> +				"eth${link}" netns "${NS2}"
> +		check_err $? "Failed to create veth pair"
> +	done
> +
> +	NS1_TEAMD_CONF=$(teamd_config_create "${runner}" "test_team1")
> +	NS2_TEAMD_CONF=$(teamd_config_create "${runner}" "test_team2")
> +	echo "Conf files are ${NS1_TEAMD_CONF} and ${NS2_TEAMD_CONF}"
> +
> +	ip netns exec "${NS1}" teamd -d -f "${NS1_TEAMD_CONF}"
> +	check_err $? "Failed to create team device in ${NS1}"
> +	NS1_TEAMD_PID=$(pgrep -f "teamd -d -f ${NS1_TEAMD_CONF}")
> +
> +	ip netns exec "${NS2}" teamd -d -f "${NS2_TEAMD_CONF}"
> +	check_err $? "Failed to create team device in ${NS2}"
> +	NS2_TEAMD_PID=$(pgrep -f "teamd -d -f ${NS2_TEAMD_CONF}")
> +
> +	echo "Created team devices"
> +	echo "Teamd PIDs are ${NS1_TEAMD_PID} and ${NS2_TEAMD_PID}"
> +
> +	ip -n "${NS1}" link set test_team1 up
> +	check_err $? "Failed to set test_team1 up in ${NS1}"
> +	ip -n "${NS2}" link set test_team2 up
> +	check_err $? "Failed to set test_team2 up in ${NS2}"
> +
> +	ip -n "${NS1}" addr add "${NS1_IP}/${PREFIX_LENGTH}" "${NODAD}" dev \
> +			test_team1

Note for a possible follow-up: it looks like that the above will fail with:

Error: either "local" is duplicate, or "" is garbage.

when running in ipv4 mode (not invoked by the CI/self-test infra), due
to the quotes around ${NODAD}.

/P

