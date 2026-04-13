Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F243C9EDD
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776085519; cv=none; b=YaRDYspTs212Q3sysm9Jqb1hJIJp5SQSQYRXNRnlIPsE+xGpN5AgvLqaGXcy1V5V99d9+DjDWb6VCELfyScw0wzqcSmhgm6gIMF3gP9YgvTiAiNXYbHs4scTy7nqGjn6kfVqw5QxLnO5GltwcWfnMOMATLZAcA5NoDp6gyHJFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776085519; c=relaxed/simple;
	bh=8G0n+5N46kyHlC6zW0UIk+1mROJfOmueHkVVdUErsrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJo7r52J407aVWwqsCAlQ6WGGQLhRMmRU/XTdD56tz9+9Crc1iYCXxAf5Y/mQroQiDRn+it3ZdmCdwsxXIj0uRMhI+80saIi6w7rFeKS4jsWBaRJcMDrmtYsH6AtJUaVjCYBCYp3U901qrVXH+IeOUkBj8D8ij2XGRfSzqJZzus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UtReE8S8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=koxylMD+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UtReE8S8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="koxylMD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776085517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zd81MzorX7tMHzshw5o/gcRBDu2OrmNaB6rEAdDyIBo=;
	b=UtReE8S8RjUy/9gLw1HNe8NKcYNtvNfvZrHV3yFo5vENigOhu6IVhnzt2WDvSHKebJ/Mhu
	xOFNZKlulbMhhHVQXPIj6xXfOKLUxAPhTFd0vkPAuoN0zVw20YdZj+a/54HcmEbqvLwNs5
	p7PNQoWhqXNlF9xuDUJhsSjqnoD+O1I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-m7WwVOtJPMqiHsJmkbWMJg-1; Mon, 13 Apr 2026 09:05:16 -0400
X-MC-Unique: m7WwVOtJPMqiHsJmkbWMJg-1
X-Mimecast-MFC-AGG-ID: m7WwVOtJPMqiHsJmkbWMJg_1776085514
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43cf5b4dac8so4724412f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776085513; x=1776690313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd81MzorX7tMHzshw5o/gcRBDu2OrmNaB6rEAdDyIBo=;
        b=koxylMD+54L8TU0zc0K3STIMtnPNwAQduzTOnbW9iMtZWu9x5z5EV5w6A+QBmCyF3R
         PbeEdcKqyo4NdsJGNEBeR/obIkqz2UIoJoEhnSGd92sg2yT5ijAtOJX6wadlaJjyh3bS
         Lm21oA+EJRALpZOEGF9Q3SN5xKjvq8YOQlR6DWVVdijPzUebHF1tlFppF6bccl78Nul9
         wXRZOyL71B/w2EyaF0VbNAjpG1yZoe1HnouXS1OdjOcuGhTLYvIIcXCknlQ+fCDB6/UD
         2yD1OHksF5kH8MOhRHBF5Zz3yGZ2hJ9KfX4V/6rdFYhPQxP3uMbX+zkCOcXoA5BqFpZs
         EL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776085513; x=1776690313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd81MzorX7tMHzshw5o/gcRBDu2OrmNaB6rEAdDyIBo=;
        b=FG5XblVeXt3oSJQ5kiPwaOWLgYb7gsYSrkiFEht1wG14Xq9f/2zuPcz0cK/t+whY0O
         mH5eOoH7SPz1aMABsh7MAapAUHoDk6hVkM+3EO3MV9ARqLS0MtN7d2uWKuYNanbcc4Cg
         +HA4lj8yM0MLMv0UL37dWfgrY4SPUVSMpZ6S+HGw87/sqGZ4/fBhaLxmAsIIx/f72aC9
         9P/b/Le5mHJiZYDgT8LX1pRttZaGdiP7n/RrmgQETBWweMR5GzJfpkvzl7+1xq1ZPbyZ
         k0GZrSJjFCrhS+ZGBaGK26auLAYixfOH3zYPGn7AgQwMEYV3b8PjAScfou7zGCKrp4Cx
         XRpg==
X-Forwarded-Encrypted: i=1; AFNElJ+DTuiYgcMMJBg04bI7iHJ8+8+3odOtXLYADXrokynh/hWE+Rs211s4/pZ0Dbc9R4poxsOp3MVpHWs7a1ucO1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHV331tC3lnxkYsoxiUbo8vkrI6AyHzVY1ydV4kib2JtwuVtF
	c06/hDkjwTzqr60ISZ6M+EhGBggyR6tnniRBE31kGpzdUR5lrM7n3H6e7bwrcHxhVTEeyHnCTT+
	wVWKgYvUUqsq2pFUlod45P65tqGU7LaBtZDeig2GJlRL5OZVpJCKKbJq5x9mE9uvLXdlXuQ==
X-Gm-Gg: AeBDievJATN1UHWAA+o0JhA6Or8ABDy/GZOxpmWoF7ZaYF2O+Tm/4INV4yzsOPsx+fB
	BVoge1w/4+2VNah8aN7PXUOCQL0PGHQ5TzIJ/ru4YL8sPcHaf7z/TaTQ1ZWKkSoJj9RBGDZDQqX
	mRrtFZaxgChCE9ZAEVI/2Dyw3ZC81SvYZ8kR6tBm+wze+iEYu11F55GvuhJ1G51FSnNo9u/4ZpM
	79+nIYhEqapN+R5AQtRINDaltDapzVkB5If4tYe61Llif+7DPlM7XVKoay6aK9q17QIZFDxPdXb
	srPEypFIEh4lrAOjlPSx1MxPKIAQL5Q6snrQ4e0UGEXWH0r80xvD4hRZqNsR6QjpvkZXq8DiT6u
	qbWEhjWFtQKmHu+2NIzYBlESZfR1fSf0xMzhn/01gqbNyHGfpzzjJHNqO
X-Received: by 2002:a05:600c:681:b0:488:e192:6fbd with SMTP id 5b1f17b1804b1-488e192710cmr60961375e9.30.1776085512958;
        Mon, 13 Apr 2026 06:05:12 -0700 (PDT)
X-Received: by 2002:a05:600c:681:b0:488:e192:6fbd with SMTP id 5b1f17b1804b1-488e192710cmr60960105e9.30.1776085512328;
        Mon, 13 Apr 2026 06:05:12 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm209725325e9.5.2026.04.13.06.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 06:05:11 -0700 (PDT)
Message-ID: <ce718e68-22bb-40bc-a046-8fc9b636590b@redhat.com>
Date: Mon, 13 Apr 2026 15:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 04/10] selftests: net: Add tests for failover
 of team-aggregated ports
To: Marc Harvey <marcharvey@google.com>, Jiri Pirko <jiri@resnulli.us>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com>
 <20260409-teaming-driver-internal-v7-4-f47e7589685d@google.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-4-f47e7589685d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/26 4:59 AM, Marc Harvey wrote:
> There are currently no kernel tests that verify the effect of setting
> the enabled team driver option. In a followup patch, there will be
> changes to this option, so it will be important to make sure it still
> behaves as it does now.
> 
> The test verifies that tcp continues to work across two different team
> devices in separate network namespaces, even when member links are
> manually disabled.
> 
> Signed-off-by: Marc Harvey <marcharvey@google.com>
> ---
> Changes in v6:
> - Use a tcp port with no associated service.
> - Make tcpdump helper function not string-replace port numbers with
>   associated service names, even on Fedora, which has a tcpdump patch
>   that changes the required flag.
> - Link to v5: https://lore.kernel.org/netdev/20260406-teaming-driver-internal-v5-4-e8a3f348a1c5@google.com/
> 
> Changes in v5:
> - Use tcpdump for collecting traffic, rather than reading rx counters.
> - Link to v4: https://lore.kernel.org/netdev/20260403-teaming-driver-internal-v4-4-d3032f33ca25@google.com/
> 
> Changes in v2:
> - Fix shellcheck failures.
> - Remove dependency on net forwarding lib and pipe viewer tools.
> - Use iperf3 for tcp instead of netcat.
> - Link to v1: https://lore.kernel.org/all/20260331053353.2504254-5-marcharvey@google.com/
> ---
>  tools/testing/selftests/drivers/net/team/Makefile  |   2 +
>  tools/testing/selftests/drivers/net/team/config    |   4 +
>  .../testing/selftests/drivers/net/team/team_lib.sh | 148 +++++++++++++++++++
>  .../drivers/net/team/transmit_failover.sh          | 158 +++++++++++++++++++++
>  tools/testing/selftests/net/forwarding/lib.sh      |   9 +-
>  5 files changed, 319 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/team/Makefile b/tools/testing/selftests/drivers/net/team/Makefile
> index 02d6f51d5a06..777da2e0429e 100644
> --- a/tools/testing/selftests/drivers/net/team/Makefile
> +++ b/tools/testing/selftests/drivers/net/team/Makefile
> @@ -7,9 +7,11 @@ TEST_PROGS := \
>  	options.sh \
>  	propagation.sh \
>  	refleak.sh \
> +	transmit_failover.sh \
>  # end of TEST_PROGS
>  
>  TEST_INCLUDES := \
> +	team_lib.sh \
>  	../bonding/lag_lib.sh \
>  	../../../net/forwarding/lib.sh \
>  	../../../net/in_netns.sh \
> diff --git a/tools/testing/selftests/drivers/net/team/config b/tools/testing/selftests/drivers/net/team/config
> index 5d36a22ef080..8f04ae419c53 100644
> --- a/tools/testing/selftests/drivers/net/team/config
> +++ b/tools/testing/selftests/drivers/net/team/config
> @@ -6,4 +6,8 @@ CONFIG_NETDEVSIM=m
>  CONFIG_NET_IPGRE=y
>  CONFIG_NET_TEAM=y
>  CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=y
> +CONFIG_NET_TEAM_MODE_BROADCAST=y
>  CONFIG_NET_TEAM_MODE_LOADBALANCE=y
> +CONFIG_NET_TEAM_MODE_RANDOM=y
> +CONFIG_NET_TEAM_MODE_ROUNDROBIN=y
> +CONFIG_VETH=y
> diff --git a/tools/testing/selftests/drivers/net/team/team_lib.sh b/tools/testing/selftests/drivers/net/team/team_lib.sh
> new file mode 100644
> index 000000000000..2057f5edee79
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/team/team_lib.sh
> @@ -0,0 +1,148 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +test_dir="$(dirname "$0")"
> +export REQUIRE_MZ=no
> +export NUM_NETIFS=0
> +# shellcheck disable=SC1091
> +source "${test_dir}/../../../net/forwarding/lib.sh"
> +
> +TCP_PORT="43434"
> +
> +# Create a team interface inside of a given network namespace with a given
> +# mode, members, and IP address.
> +# Arguments:
> +#  namespace - Network namespace to put the team interface into.
> +#  team - The name of the team interface to setup.
> +#  mode - The team mode of the interface.
> +#  ip_address - The IP address to assign to the team interface.
> +#  prefix_length - The prefix length for the IP address subnet.
> +#  $@ - members - The member interfaces of the aggregation.
> +setup_team()
> +{
> +	local namespace=$1
> +	local team=$2
> +	local mode=$3
> +	local ip_address=$4
> +	local prefix_length=$5
> +	shift 5
> +	local members=("$@")
> +
> +	# Prerequisite: team must have no members
> +	for member in "${members[@]}"; do
> +		ip -n "${namespace}" link set "${member}" nomaster
> +	done
> +
> +	# Prerequisite: team must have no address in order to set it
> +	# shellcheck disable=SC2086
> +	ip -n "${namespace}" addr del "${ip_address}/${prefix_length}" \
> +			${NODAD} dev "${team}"
> +
> +	echo "Setting team in ${namespace} to mode ${mode}"
> +
> +	if ! ip -n "${namespace}" link set "${team}" down; then
> +		echo "Failed to bring team device down"
> +		return 1
> +	fi
> +	if ! ip netns exec "${namespace}" teamnl "${team}" setoption mode \
> +			"${mode}"; then
> +		echo "Failed to set ${team} mode to '${mode}'"
> +		return 1
> +	fi
> +
> +	# Aggregate the members into teams.
> +	for member in "${members[@]}"; do
> +		ip -n "${namespace}" link set "${member}" master "${team}"
> +	done
> +
> +	# Bring team devices up and give them addresses.
> +	if ! ip -n "${namespace}" link set "${team}" up; then
> +		echo "Failed to set ${team} up"
> +		return 1
> +	fi
> +
> +	# shellcheck disable=SC2086
> +	if ! ip -n "${namespace}" addr add "${ip_address}/${prefix_length}" \
> +			${NODAD} dev "${team}"; then
> +		echo "Failed to give ${team} IP address in ${namespace}"
> +		return 1
> +	fi
> +}
> +
> +# This is global used to keep track of the sender's iperf3 process, so that it
> +# can be terminated.
> +declare sender_pid
> +
> +# Start sending and receiving TCP traffic with iperf3.
> +# Globals:
> +#  sender_pid - The process ID of the iperf3 sender process. Used to kill it
> +#  later.
> +start_listening_and_sending()
> +{
> +	ip netns exec "${NS2}" iperf3 -s -p "${TCP_PORT}" --logfile /dev/null &
> +	# Wait for server to become reachable before starting client.
> +	slowwait 5 ip netns exec "${NS1}" iperf3 -c "${NS2_IP}" -p \
> +			"${TCP_PORT}" -t 1 --logfile /dev/null

Note for a possible follow-up: the iperf3 server is apparently never
stopped. You could used the wait_local_port_listen helper and
the`--one-off` iperf3 command line argument to avoid that (or explicitly
killing the server pid at cleanup time)

/P

