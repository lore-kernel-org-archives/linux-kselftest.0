Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C9A34D92C
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450780; cv=none; b=ZnY7eO0LvMbJwjiDvazWMU5DBfukKgdLcNyy60CMeIYReLbvFmjI+yvswYDX7/JyZmYbg91wZldVB6n9AIpvOg8MZjAK8ii5ruVb5igKyP8vFREGSUaMLfpVcfh6/sPZHpSpDxYSxbXK3uWQKkkEfjJjcPBWGYwMh9bWXW6rfRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450780; c=relaxed/simple;
	bh=BNrDy675mmdy4XPBGUbWc4CQ31CrT/az703jzGOZx/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy2O1caNGAx3Aj0R25l081EPINLre9RZRNbVNcTNufyZ85xxdeHLn2MGgylel4Fw5K2B05xLyKMCTP5MUFZM0S8P+18xUc3FoSFE0VsFNAhSY8riv9Kr8DaZhCWmapFI7Qp7f7aHxzTOtIYfJWIQcrXcilS+CtHoq6qDjKYolLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiynqPKn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiynqPKn"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so838186a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 12:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450778; x=1791055578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cyceWOzuQjfKZBFIv9fyfw3FzJmEx++L3+pwgFP4N30=;
        b=HiynqPKnS+wjrMhfdhPHmqdsIjktFTcU2X5FdvzerguUu28/ukIgSaf/04giVBUMgj
         W6i4NFudRXqb1SWhERRxBfMYsJ/t9UpmzdQX4nd4qosqAHhbcJjlmboncrqhw1FJv6bJ
         o8XvHmSCqZXuTxlHHmmqZmZu8YXSUVcVI88OPXLcg3gAdjAM+kf6AGttbWdtRwJfpfd3
         88nYuw3FXiViQhU12JE3R5PJ78bvL6e5bCvu9nQrWd5Q1oKT8tj0fbGUsjILIy0J2x/u
         yk4rTVtk9oNSETS12t6Ucu0UH8uHuem771D0C2BLbg4aGQ2AhRgZBIP6bI4ZDVnh1oTk
         whiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450778; x=1791055578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyceWOzuQjfKZBFIv9fyfw3FzJmEx++L3+pwgFP4N30=;
        b=Qb+sDAmSQo49nq6c4x4V1k9DP8GXlTPa18XV8x+wHA5f01yeGAdoZWmNpp3mscivkQ
         T/ri95IDLBbB1g+nMAIIATj4A/44GmOYzATwR/7Py/0udXWolAHF1oLU+lOooEwmI1uN
         dpSI0S6bqxCptB4svu3PaEvcpjXB9l7qIb6p+mpRVQ8DUJeq+0IFA7M0UyhAE+FO+9nI
         bMM+D7PlBovFD0HWVc5O4cen75jp7poHzT57oYSj89kSPRyF57cLrmmthtgrpDWn2Xby
         rMyCjk4T9rxQP1u1MoWD6DEtc1M7ekrOgPGVeqyI6J/ruOeIpZ/mv/cAFI1ptuyeN+ws
         wv6A==
X-Forwarded-Encrypted: i=1; AKwUvBz4xvriER/0Pb4iGCSamJF/MUDugIp+j9/1UFX9V8ohX5WmzOKub3XLTVbGzm50zNhJYPrgxp776tKO3BiT4ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFB6/AN1/tVdlzW0dwxDj8TYvkQSv2pjWmqZP3Qus0rkMHaWtN
	WxJ293BIjJ2cL02Bp16ZCtc6TUp77lCedIP0GFHquIZIXTOBfnBVcywh
X-Gm-Gg: AYBFou2M4QjZQY/r4VQINuAFwb+7JjXdo3OWHIpZwXXElm86rB1+VSKCvZEelKAJK2e
	m48TCYGyuGvynR/Mguhudt7U5D6ZwRB6ot4yJA/+sqCiZnaMfaBnD+nnjC4IkYImEevuUO4IkIl
	5phm6yPUqw/JtDJp6rzGmIyVEZfYmD/X8t5+7wfk2dzNHw/mpERa6ElUNoqIeLYcHWOpLnZisMY
	3lHDelPvWYmy+reaVw/DPqU+S0/fzsYQe1uVIJVBruVDMC+xxc0/6m/MAKSipOwtH4H+IU2BUaB
	kKK6RXPUJbyBfDBNNydl+7Z/qjj+QRaTixznSOIIrB3uaJmx3CVfVufcAYUeVPdu88LMeUp8STN
	/yyH62MhQqCdrfPt+SmBT2ItbUoQONuqne3/EAbZCvc6GW2wX4PRpFvu3+g5A9B5lbi7seaZ8fx
	A/rb+PiMB7vEM3W62N7yctaOGW6KcS07nUwKn+YBSeayxjg0oB+u8W6PvwFhQzlBbcpWiUIw==
X-Received: by 2002:a17:90b:2703:b0:3a0:2ffd:1a4b with SMTP id 98e67ed59e1d1-3a098ce5269mr7939345a91.25.1790450778230;
        Sat, 26 Sep 2026 12:26:18 -0700 (PDT)
Received: from gmail.com ([2a03:2880:7ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9589f7esm10959752a91.10.2026.09.26.12.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:26:17 -0700 (PDT)
Date: Sat, 26 Sep 2026 12:26:04 -0700
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org, Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/2] selftests/net/openvswitch: add SCTP flow
 key test over IPv6
Message-ID: <argcBvCnQxrkCk0P@gmail.com>
References: <20260918144647.2024095-1-houminxi@gmail.com>
 <20260918144647.2024095-2-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918144647.2024095-2-houminxi@gmail.com>

On Fri, Sep 18, 2026 at 10:46:46AM -0400, Minxi Hou wrote:
> The merged SCTP test covers only IPv4. The SCTP branch of the IPv6
> extractor (the proto=132 walk after parse_ipv6hdr) and the v6 side of
> the SCTP netlink validation (match_validate() requires the sctp() key
> whenever ipv6(proto=132) is matched) have no selftest coverage.
> 
> Add test_sctp_connect_v6 mirroring the v4 test: bare icmpv6() flows
> forward NS/NA, and ipv6(proto=132),sctp(dst=4443)/sctp(src=4443)
> flows gate the association in the same three phases (flows installed,
> removed, reinstalled). A keyless ipv6(proto=132) install must be
> refused with EINVAL, pinning the reject side of the match_validate()
> rule; without it a regression dropping the requirement would pass
> unnoticed. The refusal is asserted to be EINVAL specifically, not a
> parse error of the flow string. After the association succeeds the
> test also pushes a known payload across and waits for the listener
> to log it, proving the datapath carries the association's traffic
> end to end, not only its handshake. Skips when the sctp module is
> missing, socat lacks SCTP or IPv6 support, or IPv6 is unavailable;
> an association or payload failure with the flows installed fails
> the test.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>  .../selftests/net/openvswitch/openvswitch.sh  | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
