Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B59844C654
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117098; cv=none; b=GIDjBTKRdZX6r9UbDpN/4QhiK9UB1WTfSQrA7Bt/M/H4v/MmhGI1WghE2iy9hrcSueupGHx74rGroA59In33tZfIk4ovoZsDsdgU/DqMoD3AnUxv+u5A3khOsQyh8KP07lsjH137k6zwQoGQZDHq9XokgVVarV4TdoYmJfZ1rcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117098; c=relaxed/simple;
	bh=BQgS4PSc6iKWPRdiaBG9tqPO+qRoWiapAQs3fO1eUUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRBVFJI4LAXZwlgPUytDXLXQ4fVN9Jqo8xUin3CCc85DRbChAM90Y1ftszRDi3cey+KDekpQhFAC/nj2TM2m3KH5/emsKcvZ0DEiMxif4H2sIsYXTeiRZewwbD+sPbrpqCse3iWzFRcHHbw2N/dbtU4McHFGmV7K/eLWZj+Xi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=CWW3iAbn; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="CWW3iAbn"
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 420FE3F2AF
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784117091;
	bh=+z+RzjMGuQ/YSdTKVlvqpqDBNtM7z+VQSzpuoiUHP8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=CWW3iAbn8bp3UeYqlftDMXC76PRH9qyZw2bihjOoexP3WdLAG5ZcSBXDHZu19A/85
	 D3+9tZZ9L5n07agzwhqmMZgvtd7N6hL6HY1ciR48OweLxBvxAYnedyfBOXiT5UyLBL
	 D93cpxg9fDRytEI5Af0f71c8YxXa8zqFBq+pB9NJ3+x5yH9cQ1/8MUWLWvXVHRp1hx
	 lA5GMwdsGJWpT7aUAA99GZwmxrlbR8ydYDSRkzwnpbxsgFa+PIbOWKzm0HGFuT3aTY
	 ldFAwOcZRm9XmV0LDpK0N1qZ3k0gzwWQrTUF0AZgE3ry1rRMrU6n/xqYca6+msb6sC
	 HSbSglVc7Tkvz5hIevUmp689SMsa+la/31oo36BezXer0i/vKzr1l9cOE82fjT4NlY
	 fYyuNSDcQOn8L90CojAk1w+ALv0CEd3R8x4TlMIEFhxLYWicr7pMVqMNzMYy5Qi/ez
	 JXxAjwHiMoxGa7D0PxpOEWRCXISlhX/o71Tf0ExQcJmFdHRGm0sjl27ys/wzEUHUcd
	 RMu3dg2b9Op1h6ojwms4nudkn1WEgJ9rc1OzppW0q7FFSsp90a6NjhjEfJkB+/K4U9
	 Atwx/53Z7atU3rNGNFlHO+j/QjUSu2Cd1Nabt8PtWcgAnsViLkRI2wycvqDirkNZvo
	 sbB6e4EE83BtF1ij97U/j3zk=
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493ba771d1bso20852375e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117091; x=1784721891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+z+RzjMGuQ/YSdTKVlvqpqDBNtM7z+VQSzpuoiUHP8w=;
        b=UEabriQ1qSubJJaL4YqKqFbnl/7u9jxmNAhzLtQ40vwsrtT6CQvmnoGmHPQnfUwvDI
         7N8ogxp/pT917w6h6AOoVeUL62I0+hxJMBCk8vT+BzZ8D7RwQjSTpyoKtqTD6/ZC7UAa
         U2nIiq5YvXZB/qs/WJxCeUdA9vjVFp34z44u2vmwerBDfXtpqKLugMVo6em3bZvqT81C
         ABo0C0HpRmUTGH5KlIlh3xlikC2/Um3fb1ShiWn0UwMGRYdcjSA/dhrs72auxZDazjOQ
         mY3ok+U0vPHlod6QeU8rZCjIwdlMaXPTMfFPIBGeBU7Sv2RQgIey06OvL9WIWe1uVDLR
         zEUQ==
X-Forwarded-Encrypted: i=1; AHgh+RomDlBwaLeqrl8zqyuhTvJSzjAl4BcB9YxXWG0RypD0PcCrzGgunjMPl3QhgqlaK8n7EcNffHJagBAXpx1soag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT2EPUIQHg6e9CkOewldNhHCL0O0IbOfNLZNHMiHM4zq8Zk3qc
	FPWMFc1i2+Wux2l2RgaDu6ZV8b2vC40deF6oux5ufIgFq0HFz1Z+JM6DabjG7I5dkMXYyzUX2mW
	NbFpX3hi8OXnUWvLTQJXCx2kJiLDVv7DONlNRqEv+vuf8olVUOfrxpQEB1kHJnoe2UYb4Mti65o
	t/h15rj7cmqw==
X-Gm-Gg: AfdE7clhU+yrsgqJyjVeY1eTrqCWiZbiYeF3uuiV5GYB2CgFg549bEbVAzrBHiXTV1o
	j1kmGpnU6Fehl4Z2tgpT79C4eJhAbrKmRT8EFzDAc2f2Gr6AOAFzRM/hhYzNUDG3G0fp4AXhMbU
	z1SK7W7YucaTjaNhc//qMX0dV1d6Fh/dQXzecp/caXGtZdyQ+uHLlbJG0A8QyQMXBfSluIZanaQ
	RPEZNCvALmguo18acDTK/HRfTfXBma4W8DtDGMmD9tvruzbVxePxKtch7OAv/UVX4koR/ONIlkE
	WfAZB0Do5C4LxWCxTysx529qZDjfsCmAbSdAhEdTrswBgl+0cFDMSV+xfy/Av51N2YGE3nyZuGW
	YO+yFUZNDolRHp7A/7QMgh2kJu5Bh5TzAA3raQCSJoyMKFdCDEiyaRQPplCtJw2kTfanRF83+Lb
	9ULzaZxA==
X-Received: by 2002:a05:600c:638f:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493f87d8aa2mr189149375e9.2.1784117090840;
        Wed, 15 Jul 2026 05:04:50 -0700 (PDT)
X-Received: by 2002:a05:600c:638f:b0:493:bb0:3b43 with SMTP id 5b1f17b1804b1-493f87d8aa2mr189149035e9.2.1784117090415;
        Wed, 15 Jul 2026 05:04:50 -0700 (PDT)
Received: from localhost (93-40-66-109.ip37.fastwebnet.it. [93.40.66.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950873270esm142818155e9.6.2026.07.15.05.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:04:49 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:04:48 +0200
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	stefano.salsano@uniroma2.it
Subject: Re: [PATCH net-next v2] selftests/net: Skip
 srv6_end_dt46_l3vpn_test::host_vpn_tests if iproute2 too old
Message-ID: <ald3YDcHxtoR4B95@cicciput>
References: <20260713095750.2671173-1-alessio.faina@canonical.com>
 <20260715111530.fc982bdd10eb499cef8e9196@uniroma2.it>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715111530.fc982bdd10eb499cef8e9196@uniroma2.it>

On Wed, Jul 15, 2026 at 11:15:30AM +0200, Andrea Mayer wrote:
> On Mon, 13 Jul 2026 11:57:50 +0200
> Alessio Faina <alessio.faina@canonical.com> wrote:
> 
> > In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
> > the End.DT46 support is not available and the host_vpn_tests test contained
> > in the srv6_end_dt46_l3vpn_test.sh file is failing in some kernel backports.
> > This is the result of those tests:
> > 
> > ################################################################################
> > TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
> > ################################################################################
> > 
> >     TEST: IPv6 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]
> > 
> >     TEST: IPv4 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]
> > 
> >     TEST: IPv6 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]
> > 
> >     TEST: IPv4 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]
> > 
> >     TEST: IPv6 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]
> > 
> >     TEST: IPv4 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]
> > 
> >     TEST: IPv6 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]
> > 
> >     TEST: IPv4 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]
> > 
> > To amend this, check the current running iproute2 supports the required
> > feature and, if not, just skip the test to avoid a failure.
> > 
> > 
> > Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
> 
> 
> Hi Alessio,
> 
> Thanks for the v2, the code looks good to me.
> 
> One question: since the check now exits the entire script before setup(),
> should the subject drop the "::host_vpn_tests" part?
> 
> just a nit: test_iproute2_supp_or_ksft_skip() uses spaces, but most of this
> file uses tabs.
> 
> Ciao
> Andrea
> 
> > ---
> > v2: 
> > 	- skip entire test suite if iproute2 is too old
> > v1: https://urldefense.com/v3/__https://lore.kernel.org/netdev/20260708152745.2430714-1-alessio.faina@canonical.com/__;!!O5Bi4QcV!CGb1HmTUSZ4JwCff0mVcoY_KnoHJmrGDAdGnPOEYWRVFi-J05H-ZtpLVZBNK12kwLaNmhzw7mrQw4M_eY5uuSft8PRuFHqU$ 
> > 
> >  .../testing/selftests/net/srv6_end_dt46_l3vpn_test.sh  | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
> > index a5e959a080bb..cd7ac03e3907 100755
> > --- a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
> > +++ b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
> > @@ -536,6 +536,14 @@ host_vpn_isolation_tests()
> >  	done
> >  }
> >  
> > +test_iproute2_supp_or_ksft_skip()
> > +{
> > +        if ! ip route add help 2>&1 | grep -qo "End.DT46"; then
> > +                echo "SKIP: Missing SRv6 End.DT46 support in iproute2"
> > +                exit "${ksft_skip}"
> > +        fi
> > +}
> > +
> >  if [ "$(id -u)" -ne 0 ];then
> >  	echo "SKIP: Need root privileges"
> >  	exit $ksft_skip
> > @@ -546,6 +554,8 @@ if [ ! -x "$(command -v ip)" ]; then
> >  	exit $ksft_skip
> >  fi
> >  
> > +test_iproute2_supp_or_ksft_skip
> > +
> >  modprobe vrf &>/dev/null
> >  if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
> >          echo "SKIP: vrf sysctl does not exist"
> > -- 
> > 2.43.0
> > 

Hi Andrea,

Yeah, I agree with you, the subject should be updated as well, I didn't
think about it. I will update the subject and the indentation in a V3
soon.

Kind regards,
    -Alessio
