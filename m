Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B931A04D
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232036; cv=none; b=iyg7Q2c4+zil7R66tNc9UXP+PdKch4hQU5kQ72lmA5252VD9Ef+vn00JTlIjMeaPe6BgY43SeF92pLj/doiQPfH5AsRalBeqqYLk+MVdFWMj1woKqsgKb2HhaJ47Q5JLbhmt/0AxYzQY5Y1IZWO/yCwD+cyjVc/mnbCeUVuDVBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232036; c=relaxed/simple;
	bh=4ApHG23tsfCBQlAihIc7JtLXV89PM3rHQnHOW06U9Do=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QZFzgmn/BlXaGqBm57nIV2tyFnyB0EShEAMjysqhpInfH8RRPmnWI8R9ZQGscuYK+9+bPlzJHWFCGeoJ1SHSW4Ra/j6xPaKaiHuyv7OxxEfYU5tIjQLQ7DvPh4fW8j7EQNG5CpeHIrOpQloKRIag6cBSzKaFpQWAYfPFlW02NKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RD5p/IaM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RD5p/IaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784232033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l/PIEzA9NrTlrzyjSKDZkdjEaXzWkZ5PFXxW2iujoLo=;
	b=RD5p/IaM0yXee0ylj0XOI0rcakylC23dI6j/aF8rn9slRqZKWkyZ1rDU0Lb035frAblKRO
	UxPmaIEAh7Wy7DSnyQIGOhhpHFwvTsNdhjdGMCUZGHe62l95CfbrNkeLadpmY88v6TkZrL
	U20EpI1+kHMcqbuB6efjn9MX3JazHzs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-gwydn86FPpSfnirdwQia6g-1; Thu,
 16 Jul 2026 16:00:29 -0400
X-MC-Unique: gwydn86FPpSfnirdwQia6g-1
X-Mimecast-MFC-AGG-ID: gwydn86FPpSfnirdwQia6g_1784232026
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4DDA180067E;
	Thu, 16 Jul 2026 20:00:25 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAEB51800286;
	Thu, 16 Jul 2026 20:00:23 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,  Eelco
 Chaudron <echaudro@redhat.com>,  Ilya Maximets <i.maximets@ovn.org>,
  dev@openvswitch.org
Subject: Re: [PATCH net 2/7] selftests: openvswitch: add config file
In-Reply-To: <f7t5x2frlkh.fsf@redhat.com> (Aaron Conole's message of "Thu, 16
	Jul 2026 11:38:54 -0400")
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
	<20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
	<f7t5x2frlkh.fsf@redhat.com>
Date: Thu, 16 Jul 2026 16:00:22 -0400
Message-ID: <f7tldbar9gp.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Aaron Conole <aconole@redhat.com> writes:

> Hi Matthieu,
>
> "Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:
>
>> The kselftests doc mentions that a config file should be present "if a
>> test needs specific kernel config options enabled". This selftest
>> requires some kernel config, but no config file was provided.
>>
>> We could say that a sub-target could use the parent's config file, but
>> the kselftests doc doesn't mention anything about that. Plus the
>> net/openvswitch target is the only net target without a config file.
>
> We've been operating on that assumption from the openvswitch side, but
> it's true that isn't explicitly documented anywhere, and I guess it
> isn't officially supported in the kselftest framework.  I guess we'll
> need to keep updating this config as we add tests for things like SCTP,
> and others, and maybe that's a good thing like we can add a comment
> describing which tests take which configs.
>
> The downside is for most of the OVS testing we use the NIPA scripts
> and those 'inherit' the parent config, so it would be a change on our
> side from the development standpoint (but probably something we should
> have been doing from the beginning).
>
> That said, would it be worth also exploring the 'cascading
> configuration' support?  It seems like a useful feature, but maybe it
> should be a separate discussion.  I ask because of how OVS interacts
> with the networking stack as an 'alternative bridge' so-to-speak, I do
> worry about having to duplicate lots of configurations between the two
> as we expand the test coverage on OVS side.
>
>> Here is a new config file, which is a trimmed version of the net one,
>> with hopefully the minimal required kconfig on top of 'make defconfig'.
>
> Should this also remove the OVS configs from the upper level since there
> shouldn't be OVS tests executing there (ie: CONFIG_OPENVSWITCH*)?

Actually, forget this part.  The P-MTU tests in pmtu.sh use ovs to
create a datapath through OVS.  So these configurations need to stay at
the top level as well.

>> The Fixes tag points to the introduction of the net/openvswitch target,
>> just to help validating this target on stable kernels.
>>
>> Fixes: 25f16c873fb1 ("selftests: add openvswitch selftest suite")
>> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
>> ---
>> To: Aaron Conole <aconole@redhat.com>
>> To: Eelco Chaudron <echaudro@redhat.com>
>> To: Ilya Maximets <i.maximets@ovn.org>
>> Cc: dev@openvswitch.org
>> ---
>>  tools/testing/selftests/net/openvswitch/config | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/tools/testing/selftests/net/openvswitch/config
>> b/tools/testing/selftests/net/openvswitch/config
>> new file mode 100644
>> index 000000000000..c659749cd086
>> --- /dev/null
>> +++ b/tools/testing/selftests/net/openvswitch/config
>> @@ -0,0 +1,16 @@
>> +CONFIG_GENEVE=m
>> +CONFIG_INET_DIAG=y
>> +CONFIG_IPV6=y
>> +CONFIG_NETFILTER=y
>> +CONFIG_NET_IPGRE=m
>> +CONFIG_NET_IPGRE_DEMUX=m
>> +CONFIG_NF_CONNTRACK=m
>> +CONFIG_NF_CONNTRACK_OVS=y
>> +CONFIG_OPENVSWITCH=m
>> +CONFIG_OPENVSWITCH_GENEVE=m
>> +CONFIG_OPENVSWITCH_GRE=m
>> +CONFIG_OPENVSWITCH_VXLAN=m
>> +CONFIG_PSAMPLE=m
>> +CONFIG_VETH=y
>> +CONFIG_VLAN_8021Q=y
>> +CONFIG_VXLAN=m

