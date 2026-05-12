Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5E481647
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572812; cv=none; b=BApUuQH5+AEh+clTxKq2GJqZao+g3F4lU8c/IMUlQvA79R1eh3TrJikrv+t8pPsColMqY2UU3r31BGHWAZJggAoQfBV9e1nnQTFDNWWEgawnZKQnzHgO73PtARrS1GCL2+CVOZpPKIPWPYnjqYrOcvlMHp+lhLamghwofrSZ4DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572812; c=relaxed/simple;
	bh=GJ/y7fGortN5jBu8cvpMLctnF416622K/5UMEtlQUdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QXElieNHVFd3HfyLlRjGcSD33PbmVYwXLhUjA7dADRyMzFFVZO6zaB1MToMa3iKIRtYpZOfm9sMMsY7TFuXXN42cBCccgPmVVtw2hqcC9Hsjsp14BV/rEIX5HPfSKl9QAJDXUuTKkE99GVQyokpu+8elU/G0hzXQfyWZoJYth/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YPqrRxta; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W2dxQ00x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YPqrRxta";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2dxQ00x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778572810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
	b=YPqrRxta28fg5Ut0OoABBmuqzSs5JvS3UBf2C5MYBISInlow/EmbTgpCNCcLB3NGsXviwC
	WcLklQhf6Ogi2kiD4Djuxzn7U6yNXss6qFm5elZzsd7a7O4EDEcywgQcJyY4IbYUTrKxjZ
	62OfOt/434uiF20dG30SvXHmwswNpuc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-2z0A4f81OGiWfl7WJmt8pg-1; Tue, 12 May 2026 04:00:07 -0400
X-MC-Unique: 2z0A4f81OGiWfl7WJmt8pg-1
X-Mimecast-MFC-AGG-ID: 2z0A4f81OGiWfl7WJmt8pg_1778572806
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-48a5952c635so58940385e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778572806; x=1779177606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
        b=W2dxQ00xOxlFoiuhJngMUCv2QsqqzILKS9ZGsaADjuy2nWcmBPN73O4D8Nmf2kJC5p
         IY9AqI7ZTMz0Aeevyf3x82Qcb9Wl6hB59mH/9zR2Vyue8MwehGBBQlEvt1yMW87VV1wi
         +NtC190237J5L3gRFfOqady7tOKDsESevMoaQPopAQ8nCFBelVO9rHiHxiTLqcJjylnF
         4bVttSEHb7wtoe/6dx9Vse3lxNh3/Xc1EsXXnc9RLB5augyAvts1Yd8cnSnJAkQEPM/U
         FQmQRFH2dHmf8HROEYAijPA7f28dkHWiF7agkRtO73XeJKEwe7TDyP6SLJCY5ZuxfJYl
         9Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572806; x=1779177606;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyFGEYlHjHtjEOVbVD/w/qb9ux9FYhsyRj3ILgwVqco=;
        b=H/QZ39HWLgp2WD7pM9k/4+DnrzZdLUGmsn6yPrZkG11d9OJ0pCl2hLehw/bwBiXNlA
         35KxjfrNKGU2nB7gYFAkRvPfDHJC9EWP5EJZvMWOvoMKLKH25EZpz4+LFY93kY1gamW+
         FFD9xV4af0Oi5RtSmcWvyDoWbO4WmoE9fc1V66lX9tua1+vMC6Y+9EDm+53mPqTpTCh8
         Gvhdo9+I9NGPJ+y2UUPjYwCD2/7SqsDCDsAvOIV7W3Sy/jqM7fyFFPZsPCBG4NT0TQ+K
         Ei9QX4Gespl+aMJq74MMPPYTtx510Q0aN0tzZ7lh/WU4jHBQ5oR0TvF2DECb+lEHMP9D
         +/8w==
X-Forwarded-Encrypted: i=1; AFNElJ/dzd2GzNId6Lb+tj08Q/Cu4tuBpNo7IZ6uafyS4nJdssfY3KFoARlxwfOzyovj4p3s7JyVuZuKe7TA3QQtGL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZTO4V9OrfYdISyn+Mu9dyirl6h9QJ9K8HE+u/E7x7VijKAqzn
	EmK7vtVwBUGYlYbEEzzgD/6FrBHIAoN378R0Hro5G+IXQmJ521i+Qe0wj/LRQGHifIgE+z1J7oh
	AHkauRqYgqvGxhuNhp9DMH70Ov8JiEJakGPtSH5G7YHXZVJqrM7t0BSQUgzHWFnI6PAb0TA==
X-Gm-Gg: Acq92OGePBOFHbDBu0eBj0z7wrS3i6fnr6iWnMAfb8/MFfhLYxVQAu5vfEF4GS0cgBo
	nHizAyI185/lGnO2RZE/j7Ht/JiqY9RzBRAlUh/CyLJ7iEIyYte6TsVeJr91LaMGtSJWB6dUN0U
	c0R3Ljjkfbb2Oo9JdvT06lpkRuaN2qBg5ZRsXeaRmQtTWn49ZxqUceu5sZbKQrjeKFzTx9H3MnP
	V2xRXhha4VVWddvLRCAbWu/NucmV2iiJf28PKX055J/IMz8ZnemrFJDXxQ48tuLfBKB+JWVEibD
	f9fT2dI8KYN1b0Wrt5J6h8VY5brSj92qX9nEh5lEprWObD5qZriJtBcBVXP6vqXP9C4fR0DgsIu
	FFBTj0nQ+oKuth1RAzFzZjhohyk5bnc5JevIA2GbCeD0nnnizcxMLgpc=
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48e51f32aebmr396266565e9.16.1778572806222;
        Tue, 12 May 2026 01:00:06 -0700 (PDT)
X-Received: by 2002:a05:600c:46d2:b0:485:364e:9328 with SMTP id 5b1f17b1804b1-48e51f32aebmr396265385e9.16.1778572805618;
        Tue, 12 May 2026 01:00:05 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e906a0debsm41474895e9.3.2026.05.12.01.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:00:05 -0700 (PDT)
Message-ID: <05927f32-8df5-4a78-a188-5a4c2b82a85a@redhat.com>
Date: Tue, 12 May 2026 10:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: net: add tests for PPPoL2TP
To: Qingfang Deng <qingfang.deng@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Petr Machata <petrm@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260508032158.67887-1-qingfang.deng@linux.dev>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260508032158.67887-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 5:21 AM, Qingfang Deng wrote:
> diff --git a/tools/testing/selftests/net/ppp/pppol2tp.sh b/tools/testing/selftests/net/ppp/pppol2tp.sh
> new file mode 100755
> index 000000000000..5ddcc6c41c33
> --- /dev/null
> +++ b/tools/testing/selftests/net/ppp/pppol2tp.sh
> @@ -0,0 +1,93 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +source ppp_common.sh
> +
> +NK_SERVER="nk0"
> +NK_CLIENT="nk1"
> +OUTER_IP_SERVER="172.16.1.1"
> +OUTER_IP_CLIENT="172.16.1.2"
> +
> +PPPOL2TP_DIR=$(mktemp -d /tmp/pppol2tp.XXXXXX)

Sashiko (gemini) reports an unhandled error condition here. AFAICS that
is irrelevant as it could happen only on a broken system.

> +
> +# shellcheck disable=SC2329
> +cleanup() {
> +	cleanup_all_ns
> +	rm -rf "$PPPOL2TP_DIR"
> +}
> +
> +trap cleanup EXIT
> +
> +require_command xl2tpd
> +ppp_common_init
> +modprobe -q l2tp_ppp
> +
> +# Create the netkit pair
> +ip -netns "$NS_CLIENT" link add "$NK_CLIENT" type netkit
> +ip -netns "$NS_CLIENT" link set "$NK_SERVER" netns "$NS_SERVER"
> +ip -netns "$NS_SERVER" link set "$NK_SERVER" up
> +ip -netns "$NS_CLIENT" link set "$NK_CLIENT" up
> +ip -netns "$NS_SERVER" address add dev "$NK_SERVER" "$OUTER_IP_SERVER" peer "$OUTER_IP_CLIENT"
> +ip -netns "$NS_CLIENT" address add dev "$NK_CLIENT" "$OUTER_IP_CLIENT" peer "$OUTER_IP_SERVER"
> +
> +# Generate configuration files
> +cat > "$PPPOL2TP_DIR/l2tp-server.conf" <<EOF
> +[global]
> +listen-addr = $OUTER_IP_SERVER
> +access control = no
> +
> +[lns default]
> +ip range = $IP_CLIENT
> +local ip = $IP_SERVER
> +require authentication = no
> +require chap = no
> +require pap = no
> +ppp debug = yes
> +pppoptfile = $(pwd)/pppoe-server-options
> +EOF
> +
> +cat > "$PPPOL2TP_DIR/l2tp-client.conf" <<EOF
> +[global]
> +listen-addr = $OUTER_IP_CLIENT
> +access control = no
> +
> +[lac server]
> +lns = $OUTER_IP_SERVER
> +require authentication = no
> +require chap = no
> +require pap = no
> +ppp debug = yes
> +pppoptfile = $(pwd)/pppoe-server-options
> +EOF
> +
> +# Start the L2TP Server
> +ip netns exec "$NS_SERVER" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-server.conf" \
> +	-p "$PPPOL2TP_DIR/l2tp-server.pid" -C "$PPPOL2TP_DIR/l2tp-server.control" &
> +
> +# Start the L2TP Client
> +ip netns exec "$NS_CLIENT" xl2tpd -D -c "$PPPOL2TP_DIR/l2tp-client.conf" \
> +	-p "$PPPOL2TP_DIR/l2tp-client.pid" -C "$PPPOL2TP_DIR/l2tp-client.control" &
> +
> +# Wait for xl2tpd to start and open their control pipes
> +slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-server.control" ]
> +slowwait 2 [ -p "$PPPOL2TP_DIR/l2tp-client.control" ]
> +
> +# Connect LAC to LNS
> +echo "c server" > "$PPPOL2TP_DIR/l2tp-client.control"
> +
> +ppp_test_connectivity
> +
> +log_test "PPPoL2TP"
> +
> +# Recursion test
> +# Delete route to LNS IP
> +ip -netns "$NS_CLIENT" route del "$OUTER_IP_SERVER"
> +# Add default route through ppp0
> +ip -netns "$NS_CLIENT" route add default dev ppp0
> +# ping (we expect the ping to fail but not deadlock the system)
> +ip netns exec "$NS_CLIENT" ping -c 1 "$IP_SERVER" -w 1
> +check_fail $?

Sashiko notes you should clear the RET global variable before any direct
or indirect invocation of check_err

/P

