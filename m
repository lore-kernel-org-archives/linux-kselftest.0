Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1883A3B1035
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789062300; cv=none; b=ciLTFRXUfbnj0PcUIpj4wLXVzcAXDW/TwA5Ns4aUIdWnPnqzprtWapF41//QI7dOW7c7sw0YkhzXFastAgN/2mbFu6mx9FyyKZ52SB2yhM9C/ZN8zDr1Hc7rXSu+9Wp+S1ylIGj54b+3zXon2COrFAE8Gs2jgFqeN0ZHBxT6RYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789062300; c=relaxed/simple;
	bh=hOwAM19ellXTuSTfVu3GiJAsTHtYyEpB1hz91S9UrOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u5g1Fu8X25dUYrKi1Hi8Rvtac4Fo1TPuZqbxxO++Y+hPasH2q6ZKEOE+3U5v9g/2V40k5VHgN+g9xzV/fXl3/U/8sLV4z0x26Y7K1JYS/HbIRtBLVHNEG7VouH9xeDmbM1c2fMpACMMbyrBbNorM9A/F8FgbvyWvs/J8RnCUvU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MtPH5DtS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KG85I3IZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MtPH5DtS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KG85I3IZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789062279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JT+A7W1MmDpVr6cMOdIJpFjVZmY1bGOG8YUIXDNF/Yo=;
	b=MtPH5DtSyLkxWyhVeWuhTbMcSEwwS0UVTf9WwDOqujgFyeD2vY+42t4BebSaVwlWrRArL0
	N2jneWLb7orXsDRr6Gn9HleQYhROAhxLV3vXPy9vrg/SBrZQ/SB3q90MhXemAEokotqFQd
	+C5Y39DQe0lUuZOo9FqCcKzHK2YwYuQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-tt4ZsBvhPHG-jBMYHlfLMw-1; Thu, 10 Sep 2026 13:44:38 -0400
X-MC-Unique: tt4ZsBvhPHG-jBMYHlfLMw-1
X-Mimecast-MFC-AGG-ID: tt4ZsBvhPHG-jBMYHlfLMw_1789062278
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso1464748885a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789062278; x=1789667078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JT+A7W1MmDpVr6cMOdIJpFjVZmY1bGOG8YUIXDNF/Yo=;
        b=KG85I3IZNZ3vwavd7IFCxQ4KrhV5jqHBwHqn0BOcRrHaXlGr/23it85+P8Y+l1nlhV
         3Dsej6ycLcV/CILOgERUrxdpsmfhmg4gUGMMJBg0P0d0l7EtXuHKNvtKdH9qjbI62Vtq
         xngJrzVp2ZY4EvwBf9oyhZKF4aCp8H5QAivsncJVasz7B7Eq//CVDRTvU0ekteEhM6fN
         iX5QXl7nNKOTYYGChjxdgv0/7NbhOW3KfjlRlJ60jKnbPwOh+QHVZvGvYO9OP3LOtMjl
         7mdfiUiB1oGk4WpaMJUGTDIC8tzg5wzp7uFUWaWoV1E+qIu5nYRJCca448wALQQTsbT+
         f/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789062278; x=1789667078;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :message-id:date:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JT+A7W1MmDpVr6cMOdIJpFjVZmY1bGOG8YUIXDNF/Yo=;
        b=RkcxRBkLAiv9VFk9opalHc1xnvXIFkJFhvBU3lij83MrfI+qYMHEYFr/DLG2z8DGYz
         DnSbznqSXFBDEJ5FtrYtLCE1wCDcvt8Sux5JPklNFRqtkm9ktoKou0QbfzovVSCamnDx
         OjY7xwqtWnjPZBJENv4oPmDdSalb2p6r7NH/0zg65XLRJWfSAEA4u+/TkgQ3qqwqZ8sx
         V15ICFEFTCLSkcQCngu6CDkgLr5G3sqF6X99t2Lllq6A9RHN9Gt9tjU15kNnxXfuujz+
         VfnC+oVH86a47FmtLVzWJcJRlDl0MlhA2fgHHk67+w9ml8N7iJrdzRAGAI4A2+N9giCP
         zcpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+3yyyekwYMzCXxDpNIMi482PVh6U1tpj2+jBfuBmlbrEXR9PNhuHDb85cd8GfXeTBvmHGb1praAwdGcp14WU=@vger.kernel.org
X-Gm-Message-State: AFuF++lk2VqFj+TE1E4e+nQ8zCtR9mwuhOHWwwQ7fp7+iiiyJcTwct14
	e3tcKF8O2vuvohediF0GqGOYxzM7TAy2OI8k2Hc6EKEHc+oKuk3+aj5KQ/Qfgq3ooAvCNm5HF0a
	h6H+n6cX7w8a8gOiqEn82NUbD8bYN8bb7HmVRI/+ZcngODYyb2fEDBdpdlhvmyiw8kajC54l9sM
	4IkVLxanfBlG5sr+sMmEM1ZR+u0iguwkmVRYxw+3u75j6MlV1sZlV9878=
X-Gm-Gg: AYBFou3MWiTLtqy6EC15MwDt4aXK1udw10v4gGvaY9uN7gFQyu/AdE4Z0wxeZkQitl1
	l0cFYXm0P9Bnj/2PWM5VPlevbhtG2k3ruT4w8vmsr+mgOUZHS6y7+IYV6A7tsXHaY2E9iUB9uUG
	CXQfGyzmWBby2Afz/Z0PkbDsqPMYlUp/Ha17Ee+oGw6O6Fxp9kPJBpiHRIJ9A5VwPHogAoZ2Qtm
	OQrNN6AVl0pB9WmswgNdw3S07KfamKx8JhKVhiQK1Vvv5Hxd4BtKTCdEBd5JS3DgSiIqdPGkq3a
	zOiht8PKOti7tyTvAdQylHo9Ap6p86CRg1OeWo1mE/WbhGH/SYoymblbONwKdSdar+tOlUfwXM1
	tUWvW3h72LaPXZILbf90t59UMo6W3
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr3238073485a.5.1789062277784;
        Thu, 10 Sep 2026 10:44:37 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr3238063185a.5.1789062276933;
        Thu, 10 Sep 2026 10:44:36 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.25.12])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80471a3sm34848885a.22.2026.09.10.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 10:44:36 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: netdev-bot+sashiko@kernel.org
Cc: houminxi@gmail.com,  netdev@vger.kernel.org,  echaudro@redhat.com,
  i.maximets@ovn.org,  davem@davemloft.net,  edumazet@google.com,
  kuba@kernel.org,  pabeni@redhat.com,  horms@kernel.org,
  shuah@kernel.org,  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/4] selftests: openvswitch: add missing
 docstrings in ovs-dpctl.py
In-Reply-To: <178906092280.219967.16432524038911632507@kernel.org>
	(netdev-bot's message of "Thu, 10 Sep 2026 17:22:02 +0000")
References: <20260908171859.1967327-4-houminxi@gmail.com>
	<178906092280.219967.16432524038911632507@kernel.org>
Date: Thu, 10 Sep 2026 13:44:35 -0400
Message-ID: <f7t33vhm264.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
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

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
>
> - [Low] The docstring added to print_ovsdp_full()
>   (tools/testing/selftests/net/openvswitch/ovs-dpctl.py line 2940)=E2=80=
=A6
>
> --
>
> selftests: openvswitch: add missing docstrings in ovs-dpctl.py
>
> This adds one-line docstrings to the module, classes and methods in the
> openvswitch selftest helper ovs-dpctl.py to silence pylint C0114, C0115
> and C0116. No code behaviour is changed.
>
>> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
>> b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
>> index 502e6eb4c4b4..dc88cb1b20c1 100644
>> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
>> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
>
> [ ... ]
>
>> @@ -2887,6 +2973,7 @@ class PsampleEvent(EventSocket):
>>=20=20
>>=20=20
>>  def print_ovsdp_full(dp_lookup_rep, ifindex, ndb=3DNDB(), vpl=3DOvsVpor=
t()):
>> +    """Print full datapath state: stats, vports, and flows."""
>>  	  dp_name =3D dp_lookup_rep.get_attr("OVS_DP_ATTR_NAME")
>>  	  base_stats =3D dp_lookup_rep.get_attr("OVS_DP_ATTR_STATS")
>>  	  megaflow_stats =3D dp_lookup_rep.get_attr("OVS_DP_ATTR_MEGAFLOW_STAT=
S")
>
> [Severity: Low]
> Does print_ovsdp_full() actually print flows?  The body only emits the
> datapath name, the values from OVS_DP_ATTR_STATS,
> OVS_DP_ATTR_MEGAFLOW_STATS, OVS_DP_ATTR_MASKS_CACHE_SIZE and
> OVS_DP_ATTR_USER_FEATURES, then one line per vport:
>
>     print(f"  flows:{int(base_stats['flows'])}")
>     ...
>     # port print out
>     for iface in ndb.interfaces:
>         rep =3D vpl.info(iface.ifname, ifindex)
>         if rep is not None:
>             print(
>                 f"  port {int(rep.get_attr('OVS_VPORT_ATTR_PORT_NO'))}: "
>                 ...
>
> The only flow-related output is the flows:<n> counter that comes from
> OVS_DP_ATTR_STATS, which is already covered by "stats".
>
> Flow enumeration lives in OvsFlow.dump(), and main() calls that only for
> the dump subcommand, not on the show path that reaches
> print_ovsdp_full().
>
> Would something like "Print datapath statistics and attached vports." be
> a more accurate one-liner here?

I agree with this verbiage.

> The commit message says "Each docstring describes the command or
> attribute group the code actually implements", so this one looks like it
> overstates the output.

