Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932F4431A45
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558649; cv=none; b=APWTRgUy4UEYm+ECAJ3HdZ1/WRapTmW8CSriPjftYG8fIFzCIzMluGOt4XO30ltpIl/kzpgWQ/gzsc2dJNwnasfQT1ULiG/Ffv84g+xbLVOzbzOElmUxZzn+tuaTMy0HyjKxuKXxT5TbGcxY0618s7sarRxwSiT2vVcaLAIpZas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558649; c=relaxed/simple;
	bh=cF1YCM++gtCxzT7sQ99GVB9BZDa1LA1mlq8M3t5Rik8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l2VTYf7Qury/VAzdafC7cZyU/sJVyLmIpwwu4G/RCwM6SluAlxUgbKPv4LZU08U5yRD35mq0wyP6GJsOwQqBejrQ6lwmk6ifonYHKps2KEtEUQVA48/bH8wIJ3t895PnaC1LfLOZp+95IAKt11kqAD+CEEQLpOU5ousngOUALtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=arf3aqpy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="arf3aqpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784558646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=awL865fyO28VMGXok9evyOX+G7wyqLle0dPFb8IBJyg=;
	b=arf3aqpyiuDN/jrnDN+RxCVudtLUvLTeH7/Z6H060bNZLZYcfO397vTVkim7Nd8UjwyTdD
	3J1lZ8Q9cRyQ3giTH3c1KJnQPb1FlUTYppwodWO0wqXJ3o8sZJdMfJygYUkHAHE2jpDCy/
	4mLC5WcSdXt7IBrYjJK6aFJ/L4pcNig=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-30-CgV9iuZePQ6xgJpA3p9D5w-1; Mon,
 20 Jul 2026 10:44:03 -0400
X-MC-Unique: CgV9iuZePQ6xgJpA3p9D5w-1
X-Mimecast-MFC-AGG-ID: CgV9iuZePQ6xgJpA3p9D5w_1784558641
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D599180288D;
	Mon, 20 Jul 2026 14:44:01 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DA941592;
	Mon, 20 Jul 2026 14:43:59 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org,  Eelco
 Chaudron <echaudro@redhat.com>,  Ilya Maximets <i.maximets@ovn.org>,
  dev@openvswitch.org
Subject: Re: [PATCH net 2/7] selftests: openvswitch: add config file
In-Reply-To: <a2032420-b4d4-4eba-9eb4-65eeeea2b63b@kernel.org> (Matthieu
	Baerts's message of "Fri, 17 Jul 2026 11:39:34 +0200")
References: <20260710-net-sft-fix-containers-v1-0-a2915c294ef5@kernel.org>
	<20260710-net-sft-fix-containers-v1-2-a2915c294ef5@kernel.org>
	<f7t5x2frlkh.fsf@redhat.com> <f7tldbar9gp.fsf@redhat.com>
	<a2032420-b4d4-4eba-9eb4-65eeeea2b63b@kernel.org>
Date: Mon, 20 Jul 2026 10:43:57 -0400
Message-ID: <f7t7bmppvpu.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Matthieu Baerts <matttbe@kernel.org> writes:

> Hi Aaron,
>
> Thank you for the review!
>
> On 16/07/2026 22:00, Aaron Conole wrote:
>> Aaron Conole <aconole@redhat.com> writes:
>>> "Matthieu Baerts (NGI0)" <matttbe@kernel.org> writes:
>>>
>>>> The kselftests doc mentions that a config file should be present "if a
>>>> test needs specific kernel config options enabled". This selftest
>>>> requires some kernel config, but no config file was provided.
>>>>
>>>> We could say that a sub-target could use the parent's config file, but
>>>> the kselftests doc doesn't mention anything about that. Plus the
>>>> net/openvswitch target is the only net target without a config file.
>>>
>>> We've been operating on that assumption from the openvswitch side, but
>>> it's true that isn't explicitly documented anywhere, and I guess it
>>> isn't officially supported in the kselftest framework.  I guess we'll
>>> need to keep updating this config as we add tests for things like SCTP,
>>> and others, and maybe that's a good thing like we can add a comment
>>> describing which tests take which configs.
>>>
>>> The downside is for most of the OVS testing we use the NIPA scripts
>>> and those 'inherit' the parent config, so it would be a change on our
>>> side from the development standpoint (but probably something we should
>>> have been doing from the beginning).
>>>
>>> That said, would it be worth also exploring the 'cascading
>>> configuration' support?  It seems like a useful feature, but maybe it
>>> should be a separate discussion.  I ask because of how OVS interacts
>>> with the networking stack as an 'alternative bridge' so-to-speak, I do
>>> worry about having to duplicate lots of configurations between the two
>>> as we expand the test coverage on OVS side.
>
> It is not clear to me what you are using on your side, but I guess it
> should be doable to modify some scripts to merge this new config file
> and the net one in your case.

This doesn't seem to break the NIPA case (at least I can see the
'contest test' output is not SKIP, but PASS for the openvswitch.sh).
I'm not sure about the suggestion to change the script in
tools/testing/selftests/net/openvswitch/openvswitch.sh to do a config
merge.  It isn't out-of-tree or anything, and seems like that would
create confusing git state (and not desirable from my end) - the
upstream test would leave a modified, tracked file.  Was that your
suggestion?  Or do you mean NIPA itself (but I think it already just
uses the top-level config).

The config change itself looks fine to me.

>>>> Here is a new config file, which is a trimmed version of the net one,
>>>> with hopefully the minimal required kconfig on top of 'make defconfig'.
>>>
>>> Should this also remove the OVS configs from the upper level since there
>>> shouldn't be OVS tests executing there (ie: CONFIG_OPENVSWITCH*)?
>> 
>> Actually, forget this part.  The P-MTU tests in pmtu.sh use ovs to
>> create a datapath through OVS.  So these configurations need to stay at
>> the top level as well.
>
> Indeed. I don't know these tests well, but maybe this P-MTU selftest
> should move to the net/openvswitch target?

Well, it is testing path MTU across multiple topologies, so it isn't
really an openvswitch specific test.  Just one that happens to use
openvswitch in one of the test cases.

> Cheers,
> Matt

