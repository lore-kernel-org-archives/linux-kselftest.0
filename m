Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1F4E2F0B
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166816; cv=none; b=KBA711WZSJ/dZCRMhd49tjrUblUfOcfhZ+MxrtWDOm1U6gaw0nGofjLY2ZUQiBr9NCrUTOw9UUjpTsJLsQ6PEVeifisdxKk7CC0TYv7E+KoWg+58NRsCWtDiKbovrDKV5Rorn3yTX189x6+8dkDGMEIPnxPDAGx4+BlAlFW7pU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166816; c=relaxed/simple;
	bh=/OUDr07pdEd0NYS0E7/cneE0Ly1bG2H/NogSv0LJEcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ebvdesr5pH8O4GDbZYOWpmQ0K4oU2MGJ5AOsgLxJfJJQBqT/WDtBTtR7yNmzkfFCpbVlCSumbQNXslxRr8EvJdyQFpcoGCw+M2ME7Y1svhLFJ3MJbPEcTCA2fmIv1E1GqgGLAXZfJ5ptYV/Wd6xL+NZknJ6cUqogSGfC2JJLHMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4XjJfYI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LurzGr1E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4XjJfYI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LurzGr1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790166809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tnbv02KrxTWfgFsEC5I3/8nKspLCXZGQ6bITX7EXkKQ=;
	b=B4XjJfYINa1Oc5ql31xfvQXHwo7KqFH5P70yw5Z8czp2dpNt56FvAbEdFQYGk2r4XCHtS2
	LZq86eTycZHS1oPdO5KwF6D5DZTG/CWN8jkVK2Yd/i8B6KvkeWfovlMTBOX56T+FUfOH/A
	u85fQTtb6Q2tVNAhMJg7JEcpELSZGKc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-HznbebWBMj-Mh4rJtha-Qw-1; Wed, 23 Sep 2026 08:33:28 -0400
X-MC-Unique: HznbebWBMj-Mh4rJtha-Qw-1
X-Mimecast-MFC-AGG-ID: HznbebWBMj-Mh4rJtha-Qw_1790166807
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49fcc575709so8396115e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 05:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790166807; x=1790771607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tnbv02KrxTWfgFsEC5I3/8nKspLCXZGQ6bITX7EXkKQ=;
        b=LurzGr1EkRXLdaJrpJXXGqLY+q4CiyFpJ7YlpwwCCUsnUwXe3XcmEXFljvnZVNQiUF
         iTEwXaX342pPK9ed/PWMZMfr8k8nfyW1h1DZaHTxdBjU64RPyB/mw859oDbTqQxd5qnj
         kqzgVkF/Nf7DVQhNkt37elZ8Zw+Yg9X97XC94Z+4lN+UtXiXpU5nl3W9n6iAe4uwTTgh
         AoIJj2lXSQiwwqWRneraV50b9Gd8JE96u/OAy6PaODRqXzvq9bC8FUlrKltOW0x3V9Fy
         3IkkgCn2fII9wb4y6Lr1WVPqSm7KoR0wVagaGTH44p92ETyl4mfE2HXj4Msbafy+znP/
         JvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166807; x=1790771607;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tnbv02KrxTWfgFsEC5I3/8nKspLCXZGQ6bITX7EXkKQ=;
        b=e9DAQSp41ddtMyYOkg51QXsUpd3bL255jmL3sl3YXo91+MzrnNOOLASyfq7yaXZOhC
         Q7QFF/UmkEB1sJAIfqFwoQ0jxGO7en1MGx9EhNiQogtUs9/YlP9z5tD4OKLRb/o3C/1+
         R7d2gdqV8IZy2RX75AXm8lLLoffcXCm866TRjZJlXXpuWxX+M/BbM7dnNKD1RJc4gS9y
         XudhV4EeSUztf+LvbeISal/TI9iTfNSu1AfjfeChnUqoVSgIV8HDFer28+bwBKWLouzF
         21mJ1JOtxzIwIkClbrP5RuwbpVRJZDQo4rDLevW/gauOdQ3vss/haCamjwxmOY7oBRrN
         gFYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkYsokyJ6eFRcBxgVMYHKg3osoNGw1ZvpK1X/U+izKUArOCt8Aw2f54IaX7Q69w+F0bDfuFIunjhNTVBn7B3w=@vger.kernel.org
X-Gm-Message-State: AFuF++lZMjMztAhkXd1BANJ/b/pDMd0JS2v9qSjLDeTIC3KIW7hkCFAH
	/Vx7fOzRnfYG5uEsgcSsBQyShFLtu/ztFBAd2PEq/1sjuvewFVl1n+CBShTZ5VX/xzP9p6XQ2Yk
	DswHpnJtpEkFSYgAaPrdDVJWZmpH19LuqNAKjWLa3qBM+GV5Kck9hFIYMR6VQSFwfzzzThJ9U9l
	INyJ8Uwd7p0/ukrGi2zT+z+aOh40qXIQcPtqZOp2JAKiOnF/P0ybPKfLA=
X-Gm-Gg: AYBFou1BGOOg+R1z8gtNuua1PyXbBJwfO1ZEm1pkG1c0OdUNG7J3lyyb9q73lSYtA9v
	WeTk3nEDx5A2x4/WsX8KEMHJ29Gy7hlZpaUZH/24E3+tK4lwCuwO082GnUxPWvRGXCrRLyPGII8
	dYf/ylaSYy/negt3IEJh6zkpNuD9TGYEwAEQ1ijvAOAxAgHUfAmNI36Kq/As5YS5RbXGowUrHIx
	K6fQYCqSf4TWbsmL4BRJWwNCKhGnlWbLxdlWjpJ+q+sZJ7rSRBEfEm7tiUouYu1i6tqhFgkrqND
	br8aJvdp9Wr5hNG9oafSnf8DbG02GrZnK4GyXmnxdts8jefpGdWEl8a2bc4SVc4ur9CjZbXNmlq
	0nl9HgxOGObN8n/tQV5xnil8WgiHN
X-Received: by 2002:a05:600c:4e0b:b0:49e:84bf:6136 with SMTP id 5b1f17b1804b1-49fdeffdfc0mr42605665e9.11.1790166807146;
        Wed, 23 Sep 2026 05:33:27 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0b:b0:49e:84bf:6136 with SMTP id 5b1f17b1804b1-49fdeffdfc0mr42605055e9.11.1790166806754;
        Wed, 23 Sep 2026 05:33:26 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe23d4288sm43706055e9.12.2026.09.23.05.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:24 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: netdev-bot+sashiko@kernel.org
Cc: houminxi@gmail.com,  netdev@vger.kernel.org,  echaudro@redhat.com,
  i.maximets@ovn.org,  davem@davemloft.net,  edumazet@google.com,
  kuba@kernel.org,  pabeni@redhat.com,  horms@kernel.org,
  shuah@kernel.org,  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] selftests/net/openvswitch: add SCTP
 flow key test across conntrack NAT
In-Reply-To: <179008951086.2160803.550424027687672394@kernel.org>
	(netdev-bot's message of "Tue, 22 Sep 2026 15:05:10 +0000")
References: <20260918144647.2024095-3-houminxi@gmail.com>
	<179008951086.2160803.550424027687672394@kernel.org>
Date: Wed, 23 Sep 2026 08:33:22 -0400
Message-ID: <f7tld8s9mgd.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

netdev-bot+sashiko@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] test_sctp_nat_connect_v4()
>   (tools/testing/selftests/net/openvswitch/openvswitch.sh, new lines=E2=
=80=A6
>
> --
>
> selftests/net/openvswitch: add SCTP flow key test across conntrack NAT
>
> This adds test_sctp_nat_connect_v4, which drives an SCTP association
> through ct(commit,nat(dst=3D172.31.110.20:5555)),recirc and matches the
> translated tuple after recirculation, so the SCTP branch of
> ovs_nat_update_key() is actually exercised. The config fragment gains
> CONFIG_NETFILTER_ADVANCED, CONFIG_NF_CT_PROTO_SCTP and CONFIG_NF_NAT.
>
> One question below about listener teardown.
>
>> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> index aa84fafc3201..21444657a040 100755
>> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
>> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
>
> [ ... ]
>
>> @@ -1200,6 +1201,98 @@ test_nat_connect_v4 () {
>>  	return 0
>>  }
>>=20=20
>> +# sctp_nat_connect_v4 test
>> +#  - SCTP association crosses a ct(commit,nat(dst=3Dip:port)) DNAT
>> +#  - post-recirc flows match the translated address and port, so the
>> +#    SCTP branch of the post-NAT flow key update is load-bearing
>> +test_sctp_nat_connect_v4 () {
>> +	local t=3D"test_sctp_nat_connect_v4"
>> +	local payload=3D"SCTP_NAT_DATA_OK"
>> +	local rxfile=3D"${ovs_base}/${t}/sctp-rx.txt"
>
> [ ... ]
>
>> +	ovs_netns_spawn_daemon "test_sctp_nat_connect_v4" "server" \
>> +		socat -u -t 1 SCTP4-LISTEN:5555,fork \
>> +		OPEN:"$rxfile",creat,append
>> +	ovs_wait sctp_eps_has server 5555 || return 1
>> +
>> +	info "verify SCTP association across NAT"
>> +	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
>> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
>> +	    </dev/null || return 1
>
> [Severity: Low]
> This isn't a bug, but can a forked socat child outlive teardown here?
>
> The listener in test_sctp_nat_connect_v4() is started with the fork
> option, so socat forks one child per accepted association, while
> ovs_netns_spawn_daemon() only records the pid of the backgrounded
> ip netns exec:
>
> tools/testing/selftests/net/openvswitch/openvswitch.sh:ovs_netns_spawn_da=
emon() {
> 	...
> 		ip netns exec $netns $*  >> $ovs_dir/stdout  2>> $ovs_dir/stderr &
> 	fi
> 	pid=3D$!
> 	ovs_sbx "$sbx" on_exit "kill -TERM $pid 2>/dev/null"
> }
>
> There is no process group kill and no wait, so a child still blocked
> reading its SCTP socket is not signalled or reaped. run_test() then runs
> ovs_exit_sig() followed immediately by rm -rf "$ovs_dir", and the
> registered on_exit actions do ip netns del server, so such a child would
> keep a reference on the server netns and an open descriptor on the
> unlinked sctp-rx.txt until the association's retransmit/heartbeat timers
> give up. The -t 1 option bounds the linger after EOF is seen, not the
> wait for EOF itself.
>
> This would show up when the client is killed by timeout 3, or when a
> post-recirc flow is missing so the peer's SHUTDOWN/ABORT is dropped. On
> the passing path the client closes stdin right away (</dev/null and the
> here-string), so the child sees EOF and exits.
>
> The same forking-listener plus single-pid SIGTERM pattern is already used
> by test_sctp_connect_v4() and test_sctp_connect_v6() in this file, so
> this may simply be the convention here. Would it be worth killing the
> process group and waiting for the listener in ovs_netns_spawn_daemon()
> instead, which would cover all three tests?

A separate process group would be over kill.  This is already
convention.

>> +
>> +	info "verify SCTP DATA chunk crosses NAT"
>> +	ovs_sbx "test_sctp_nat_connect_v4" ip netns exec client \
>> +	    timeout 3 socat -u STDIN "SCTP4-CONNECT:192.168.0.20:4443" \
>> +	    <<< "$payload" || return 1
>> +	ovs_wait grep -q "$payload" "$rxfile" \
>> +	    || { info "server did not receive SCTP DATA payload"
>> +	         return 1; }
>> +
>> +	info "done..."
>> +	return 0
>> +}
>
> [ ... ]

