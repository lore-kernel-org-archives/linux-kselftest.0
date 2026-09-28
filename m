Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4F28B4FD
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599092; cv=none; b=ffzQBoQhKVzkcUaeLwTE3H3PQ95+bmh/MnGBCakM6fEeuyAEhZ+CU73y4JSWx9FB48iuPHzYHdhNIAtdbyZ+9cGd/NvcVQlQcFAeh3e6eHGzmp7eh09+2AxQNTScU1HeS/2pzCwDRa2iOQ1mOoQBwqR6m83xQRHkBaHUtEzwXjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599092; c=relaxed/simple;
	bh=30TSjMEV6qyJ0V5WI/lINyWBwwXZSPxQWv/Wft1fKBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QqzyegkidIfGTx2Lj+AwQpY0504chIQynrx4ruvFOPjepe1w+IeHwgZiuvVT4bmP6Snkufe7vwqE4px4CkZri9F9JiHmJBE6SN9LarUuwOSpUAjIhb4dAsWOZdWUEdYrH7dejSp1aLDKZMRviiu0A47dEVwozgyXiycyaPEhMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FTXlNY7Y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ABYiVCN8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FTXlNY7Y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ABYiVCN8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790599090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=30TSjMEV6qyJ0V5WI/lINyWBwwXZSPxQWv/Wft1fKBs=;
	b=FTXlNY7YmLadO8eIuA/7lionH5C/OVV6GERPAHfQE3JOchRSEaHSv0uijL7SVj7oZd4Cfd
	68YuUI9PZWWqUb/kpH4JJpqCxRCMj/YztMYioTihA4cZKc2WazNdcLdPf6QbedXYe0B1Tj
	UZykPbVaFQfj21MBDa+CEEVyQfR+GlQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-nT6JOTlmOmGyehjKZwJc-A-1; Mon, 28 Sep 2026 08:38:08 -0400
X-MC-Unique: nT6JOTlmOmGyehjKZwJc-A-1
X-Mimecast-MFC-AGG-ID: nT6JOTlmOmGyehjKZwJc-A_1790599088
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4888945a74fso2161770f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790599087; x=1791203887; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=30TSjMEV6qyJ0V5WI/lINyWBwwXZSPxQWv/Wft1fKBs=;
        b=ABYiVCN8wAzIcARY91FF/qxdvK5ovWc3j2Rc4OdY2Vxv4AjkZHVl9ubSKEd3EZY0wh
         K9wGP+Q9y11GxXTsHedoqEQ75GXUPzL97vArXGPG/3k1fr2reWZ9WoE6MZb+N8ekKZ2b
         143Gl7g2k6JEgtLbA6Y2LWpFQyrDkQnrBU7vEtmLV2V/+BUOZtyH+OjRTYMndimT1orT
         gEKKi5HLq0W4vvy6DUiIWLGof6/J4p22whgPJA7BvKUWAayH/LO1b0jkViumuiJGvPwX
         K8FICdwd6sJGYVFpix4b3ASjDWTwG9zzvgiH6NyuntOUzC5ThOHRDZCQtyPwI7MLR2rs
         LzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599087; x=1791203887;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=30TSjMEV6qyJ0V5WI/lINyWBwwXZSPxQWv/Wft1fKBs=;
        b=hOPOVvVZimOTpBfBQaQsSAVKX9JHSM/PlpQRRONPl2DfIpjv0l+m+jEC4XUPriVlpP
         MBKItbMQX1W6Vt5/Ke2q07GKfbSQIcVaunavi+NZuL9tDEzmQA09b9DGmF779Jb5Pf5f
         YlABNyXD5CA15JQsualgbtVFQTH7uCZ3VTgmKl1+ZAWQupQAWF2od389B7t2rHkYZH//
         kzr/3DVye1z9qVtTCCq/CyvgQ8ktL1dRGnTTiS69exdIz/uaQaZ3cDjbAbeaQ/xm+5k/
         k1hLi186KAcBeC/1KZsTuOqCRsY9g8uPqcGml+GQyQW4aQth9BXjERTVGzK24L2Jn+mV
         Bq9g==
X-Forwarded-Encrypted: i=1; AKwUvBxIOSc4AOeITNeM6srZsRohQM504WJXjKN0QCIar+lQi4tFCWkKO6pZYiWOYmPmJ9ffFUVPhkkTbluX9548oCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM6QYurGGO4qpQLKoybm5fRZWZKpnFeHiPDHRcMp/othOPoANN
	ZbS9R40BXj5emlZKtkNj6ZJikkMNZvxhUEW6le2nuaRcuQz6AqgDVazQrEott8vShuHCn1uVVJ6
	Zba8srzRP17y9XGCvojc3pvT6t/l5Iu3JdKTUwBKmuLnJ8RXrpBvUW+rs9TNWmPEYywf29QAcha
	/wKFb6pqtjpZB+G/8Z0nM9fOup3gUeFr/H81a3cPgM3yUQmUM43VHh
X-Gm-Gg: AYBFou2EUgIXiLcZZbOS2D9U8lAFe8hPMuGCouM09R8YGDWaUncrFYyaLzxka6Dm4wA
	R13PRJ8po3UvoLVQqaTZa3pm7lHTCohNILdsdOFysfK04Uwn0UAr0mFHx7RKsLvRGBfExB3yrhr
	aHqXFgVThCxIESd8MB88YNMoryEi84SfKguYEdI3/5KZoCOa8X2VfVVsmsNsM2PAI+iu0pQZmyk
	ehzzx2vamlKpPj3q80axINis6UJu+AUenxLZc1O6Se9xzMy3X+0oMeb2X9xLtzVIlcYcVwjCJz2
	+qa753ZecwvUpHD3lrdO47LOogX90YHMz5RZSJaYv74kB6yyduBlty7WUxpmb5QmiVHV54ZTCzl
	irLbHwHgku45JiwSv7FuzJxp4TjaQQxE=
X-Received: by 2002:a5d:584a:0:b0:487:72f:fb42 with SMTP id ffacd0b85a97d-48871679eb5mr25760368f8f.14.1790599087629;
        Mon, 28 Sep 2026 05:38:07 -0700 (PDT)
X-Received: by 2002:a5d:584a:0:b0:487:72f:fb42 with SMTP id ffacd0b85a97d-48871679eb5mr25760323f8f.14.1790599087168;
        Mon, 28 Sep 2026 05:38:07 -0700 (PDT)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([24.151.142.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84205esm26880704f8f.37.2026.09.28.05.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:38:06 -0700 (PDT)
From: Aaron Conole <aconole@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,  houminxi@gmail.com,
  netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  pabeni@redhat.com,
  horms@kernel.org,  shuah@kernel.org,  dev@openvswitch.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP
 flow key test over IPv6
In-Reply-To: <20260924083601.651e11bd@kernel.org> (Jakub Kicinski's message of
	"Thu, 24 Sep 2026 08:36:01 -0700")
References: <20260918144647.2024095-2-houminxi@gmail.com>
	<179008950943.2160803.15856491533624064435@kernel.org>
	<f7tpky49mjg.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
	<20260924083601.651e11bd@kernel.org>
Date: Mon, 28 Sep 2026 08:37:54 -0400
Message-ID: <f7tqzid8sbh.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 23 Sep 2026 08:31:31 -0400 Aaron Conole wrote:
>> I don't think either is needed for this series.
>
> Aaron, did you mean to ack this series? You (rightly) dismissed the AI
> slop review, but no ack. Or there's something else that I'm missing?

I did, but didn't have access to email while attending a conference.
Sending ACKs now.

