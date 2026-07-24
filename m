Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F03E28B7DA
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931223; cv=none; b=jfVoyeQmiy0IJHxPd3oxb6LDQVURiyg0A+tt2rmQzxpBmrDRE4LZKvN+0A/9qBLdobiKX93haGBEQUOIoioHWGKrvjqtxh967D/iDL+JA1M7vJyu0jcbV/CCXVgyspDp9VPtItE/FLUHE6+ArHDlzBvew5h9uuycdkzIbVZDfSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931223; c=relaxed/simple;
	bh=pMKpKubFx9kEgDbednVOQ47WZM90zaPgp5ftx3GTfMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIx7ou78pdie0IpI/es0Jw9Vd8T+nj82oGqSGawzMWxYfUk20mi+T6pX170YYWiAdV6eD4rUIct6oajX+vaN8aqHS+Y+BAiX/0gMTW7eKzaC6cs93Wd+cMRXSQFEinozRCZtjrnolFD6jUQPSzUr8mZhsczfEG2GqtKEramd8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/uu45oP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/uu45oP"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1022879b3a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784931222; x=1785536022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2sozbBNB86MDdVFB0IAFAWmkqaPuc9KNZQmr6UjhYE=;
        b=N/uu45oPkIawysFLAkQk6ltaKaCSqLTnkBhZBgm/UfB4EtlWngLPRwQbPVc4UdH6QS
         NW4ozGhV1D1K2ggsNsXTCSQ9NLjWIhQXIh0uyGoSVuHWS76jTo8jWsTug5As4xCxuJ07
         lFjT1j5tKoaIr9Iasx5scXnqPuDFkqjDVB/2o642YFIEPDjV/HDjnMKjHD52WxXIBxIP
         owgmo1iBP+NHHWXAVrvKMzVGDxW1IRwHWKyjginBqM4FESBmSV5JmEYdVkNfDN11hCUN
         fiy1QQeaT+5hlnweTVfEtxiMERK54bc9gz+Kymb2EQ1LSwRjp4L83nxkUn4q9VlgTXcB
         s3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784931222; x=1785536022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2sozbBNB86MDdVFB0IAFAWmkqaPuc9KNZQmr6UjhYE=;
        b=fj0uyXkSA5YMGV9TggKas5GuY15LnwL4KDYhn7xIrDLxJIGP3YdFbpNCgPA912Hcjx
         mkw87Ai/uODbod9K99BFD6yz1MRyI1lu5gBz37s77ArZhx3mSOcJHPKe5uzGCVumGSDg
         RUpIJNXjADpfIZlYauxO6e9iCYdIN/9BAO6AqVxpADZlzYJ68+38hAJY81UawJmCwqf6
         D4H/1V3b1GVwtBFTm7K7G6laLcOVzuc6bQVar2gnyDZlB0V0cXUl3Za4cn6YNkmAuBrP
         DydfCdGt7/Nu5DBwmL5HEyJWI+SdbL5wRigzZTrMEBBNTnAvUiz9QBUrV1g8ZtEEF3Az
         hgPA==
X-Forwarded-Encrypted: i=1; AHgh+RpeaR6wvuIHCvN7W+rmBHcPoTQPT7kHHXSKu92rU3CTKe3bZ04L/M1VTaUTYfHXR8SPeOVK3PvvM8B2Ao9vjug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1SfKrpGX0fzmjyH2SjvuOTXnzhsh9xGk92wgS45/CIFhdMtQT
	d4UBVJslAFD6c7U9Ecx21OxyJ/t8Wm4RhZq/CKPUKHclDFTHi26etdQf
X-Gm-Gg: AR+sD123o45TgemArsx4HOf/SWIlsMHxH9kgEnOKtGXxuiMUQTDlosaJes8eNiammSl
	RvJTbW+jz4DSdJdVm741+orMypHURO5GENU9cCs1remR/z2Yh8VFxCr1T75yamZAGUtTweVsorq
	OYeEFs5upMBuyk3DDFAiSID9P9n7lT8eHgCaNYK+g0Mt4epnyOylW/uw4IvFW1M8BfAQXtp4cU7
	WaJhvuvH+WgTrfWmAc43f1RmqILwd84cihjSvbv9Iq0EYYlUdvwOPyni7oA8A8qwgCvmLHqf8Y1
	pJlS3lMy0STAg0LscEc5GfAkc+tkX/Ronee5jGDCvtQvS1WmdZuArVr0jrE5Zt/Pv4SIru+aUCT
	Y7M/RbPNOThES/ySPIiLIEj64UPlIeb1keEXSG/oV3iFgtnawsrQOXo7YDwHgBvOQK68uSYnsS4
	DplF2axGMZVX6pQlX34EfcU3jbGEIOrDJXpsYXErMh9rAOf14MadaWijh3ENKUwjRtPhPxTLZ1o
	gHTtkXXkbg=
X-Received: by 2002:a05:6a00:982:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84e59544f08mr53110b3a.40.1784931221615;
        Fri, 24 Jul 2026 15:13:41 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm443138b3a.58.2026.07.24.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:13:40 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:13:37 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amPjkerd2duU2DH4@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
 <amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
 <20260724143001.5afa8631@kernel.org>
 <amPbqtxPdhs9QrVP@devvm7509.cco0.facebook.com>
 <20260724150716.07c49ad8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724150716.07c49ad8@kernel.org>

On Fri, Jul 24, 2026 at 03:07:16PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 14:41:47 -0700 Stanislav Fomichev wrote:
> > > > Talked to Stan and he mentioned the original idea was not necessarily
> > > > just for link down, but any test that could be considered disruptive to
> > > > other tests, with the idea to eventually introduce some scheduling
> > > > (postpone disruptive until the end).  
> > > 
> > > Perhaps have such conversations on the list? IDK what Stan has in mind.  
> > 
> > I don't have much to add so I didn't post on the list. In my mind, disruptive
> > started as "anything that can lead to a soft reset". But since the
> > sockets tend to survive these well, I do agree that your definition
> > of "link goes down" is a better fit.
> 
> My recollection was basically that the test is not safe to run over
> SSH (without tmux). Hence the link down concern. If we say soft reset
> that'd cover 95% of the tests so it's not very useful.
> 
> The existing doc and README already document the link down AFAICT.

Indeed, so I'll just test and confirm if devmem's existing
ksft_disruptive tests do or can cause link down, and submit a patch
removing for those that don't.
