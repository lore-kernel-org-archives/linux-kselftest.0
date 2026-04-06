Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4873033E6
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Apr 2026 21:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510434; cv=none; b=dFyQFk/Ju3VpYKnofaGnX6iRQ45Uuvq4l0fj8yaeLWVe7F3imQ3FCGCEt/chV/rpjqrKcsOTj1ExkeJWAyheS3pV8gZlfqaPbx/M+gR0DpXsXMgzCTlDqszC9B3aGodNx/Jleag70lcD36I5BgXuzivI4LC+ohihdyX06lMhUiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510434; c=relaxed/simple;
	bh=tOzS5yBZD6qH+T9+3SQjvBHwIz/KRctL1NoeMqapak4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=ERZjSQ+Xr/JWx95AxEFOh+uqBB64Qg7TFJwpQ/qapX2l3iJHytPm3NByKYg99ddlh6cbWEEtPYPCHcXjnSOCtIbsb64FxSFjwvlAjM5MQjejp1I+G1YA0zWVSKPOwtksRvYDybsecxDZETVmWKGAlsvzkIiXcwyBpFQwHzvHf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uz5117rk; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz5117rk"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6501725d888so3346058d50.0
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 14:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775510432; x=1776115232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bzs5SDxOWpPA9bqwDu45hXe3OO9/TGgNIA4jG1lKAk=;
        b=Uz5117rkle5R9ddnVfLtcC5v9UYSGxftsYq7b6UQWhQ8XofihNXl8Ocb9pSEvSJbd2
         t9wOYcwuHs0GYwzT60wt670kQj7x+t9+qTjAZxpDi/+fubVhrfCehFasGpPFOWjvXbwE
         FPjIIOPe9pdUpK4iXeUzHt2kGLNP+yVNaALnuZrQTMFK/WkadwVSK2jRSMny+AgH1sQj
         C7cjHi1X92L5+09hlKGGdswMGLSG5VWL5/DKRrO+iuK+Sqxv9Mnt4/t7EEM9zR8mTCv6
         rpQoggm33Qy2skMgDFb0oUcxO6snlllglv8jpQp9F+ODeGmWYcjfyTyz+KrsluDMP4jY
         KN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775510432; x=1776115232;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bzs5SDxOWpPA9bqwDu45hXe3OO9/TGgNIA4jG1lKAk=;
        b=VjYmiN0M0/T7xETfZWO3pZamkPVr58E7lHmtYlgJP65fQvgAJ7vfdMi/5iJBuMjwLp
         +MNRUrxwvna3Ciekg5jo5efz++GLZiblASNWZLYaw8L4xAw0WQm1smIn4f7zZwbRS2Hv
         feRLabklI79Kt6qwU7kzkyPs5Z9lOkDwlLn3eeGRKQMZVxDSpS3RhPajoYCliLvDBPN8
         TJHLj12vUQmQ+g6t+YKxCHNbAtAc5yiNdhHu4chMrHfImI1VSvRMytspWz14dpT72hty
         IReRdTj+SSg+r1kdPwRmoC4KyhFiemYQ/pJ1q0Qsq1ykAcNyXYDl+IYiVNSVRn2HPEg7
         aJCw==
X-Forwarded-Encrypted: i=1; AJvYcCWlsQEXFnlZTpyNdqL9W53yIfJymgSiO3l0jsLV+o1AM5kfVIB8Ii5Rsyu7zDMbn5N1l88VOyf/5Ip4czfSMXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAzstAU5MvaV0r8bz7cBSco12l7ShPo+QRD9npXPk+f4TDZB8H
	LYaxh6LhIKhgHFPmrC+zmOaiK18agNbgljJsMSe9BMEsWbvDYGDOknlv
X-Gm-Gg: AeBDiesGlRZvVrW2aqSxK4Jrv/uaWIu400xLp2Rgi6HEIoZNkCZkep/uyJq28sbX/PS
	mqDVOolSlPBczcLN0j3xO1r9KlwNl0wi2/dhW1BxkJVghDBSUqBayZ5nFoLYC9vv8olPL7hjSnw
	5vW1Y1qJJCh3rMk3g3tpA92auHp6wgzTnF68eHk0hSeko9lezFZiKJtJ8laplrpFMiwzKvsStpO
	3PpQ1xg8X63GduuSSg+bmG9ZxOKg5gFPkqyY1bRfdtHEXN2guG9BPaH/++H0uDBQZv7ooD+bVCW
	Sidd+BHadm2tTiumfpmr03nDj8fmED07nKkPnFVt1NK3ggDBQRewTAJmuxv1Gq9gf1ljEJTmJvf
	tZRUsqS7EZZDFaLF9i5qaYGrDAGIyEh1PE9RxdepM/CQLpeO3mJKheO0+62XQi6dA0QeH9lFXzH
	hliFMcOVM1WCJuNpQdbPeGjGBfLOYHUcu79wOGureS4LcnzwX+ExxU1h4elOL0ByK1FQw3fhkDC
	Kbi
X-Received: by 2002:a05:690e:d88:b0:64c:c616:c349 with SMTP id 956f58d0204a3-65048754a1cmr13246650d50.31.1775510432437;
        Mon, 06 Apr 2026 14:20:32 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a86d1b1sm6582433d50.9.2026.04.06.14.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:20:31 -0700 (PDT)
Date: Mon, 06 Apr 2026 17:20:30 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 andrew+netdev@lunn.ch, 
 linux-kernel@vger.kernel.org, 
 willemb@google.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.3156bd9082476@gmail.com>
In-Reply-To: <adPfTwbARPVFLys8@devvm20253.cco0.facebook.com>
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-3-joe@dama.to>
 <willemdebruijn.kernel.aa6e2a3e845d@gmail.com>
 <adPfTwbARPVFLys8@devvm20253.cco0.facebook.com>
Subject: Re: [net-next v2 2/3] selftests/net: Test PACKET_STATISTICS drops
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> On Sat, Apr 04, 2026 at 11:08:15AM -0400, Willem de Bruijn wrote:
> > Joe Damato wrote:
> 
> [...]
> 
> > > @@ -396,6 +424,11 @@ static void run_test(void)
> > >  
> > >  	total_len = do_tx();
> > >  
> > > +	if (cfg_drop) {
> > > +		check_packet_stats(fds);
> > > +		goto out;
> > > +	}
> > 
> > Sashiko pointed out
> 
> In the future, please link to the AI report.
> 
> > that there may be a race here between rx
> > processing in the softirq and check_packet_stats. Seems plausible.
> 
> Can you elaborate why this is true?
> 
> I could be wrong, but I scanned the code and __local_bh_enable_ip seems to run
> softirq synchronously in this case, so I think the code is correct.

You mean that after the return to user in sendmsg, the packets are
guaranteed to have been queued to the sd->input_pkt_queue, the napi
schedule was run by enqueue_to_backlog and napi was run on this
cpu as a result of reenabling BH. At the end of dev_queue_xmit? I
recall that there may be a common one on syscall return too, but the
details elude me right now.

Either way, makes sense. I had not fully appreciated that the 
softirq schedule is this deterministic.
