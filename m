Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0F2FD1D0
	for <linux-kselftest@vger.kernel.org>; Sat,  6 Jun 2026 07:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780731934; cv=none; b=OWi/NQ3XimMA+vyBXwrKTx9dorzZIsLatarBJQxJHOadJdXercKbic30InoH+povNBOzd3yNaBHCccdQM5Au8XmpkhlEIDraIa9d9ha4I2Icqf7W+F/8WdEbAGyqfaaesuGlwjcEo3MEki3XApwYiLvJgCSydtRE85Lbeqs18bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780731934; c=relaxed/simple;
	bh=v9RFj9MLdQbf0mLs20/N3qsqWDLSHOEx8cvUCHKQTcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWgadVykbVtTBQKkcEnDK4YdpSwq142W5E979gq+YW3XCDFm5tK/KvC8rUINSFouxK56V0tISEhBuFZplG319VcfUYPJKBZqvoByD9yIhJiAibFxVuDdIBrWEyK5fhRjNte1WvJ+XVJHfImfqJ07IjF7sf0VLg9jJ/eQZhDuo78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J89U8wFJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J89U8wFJ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8423610ec93so2115623b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 00:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780731932; x=1781336732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=soOeU2aKGw0sdOWk6ao9iMdkrGHwTA85Ix/Vj7V69uU=;
        b=J89U8wFJwcO8RuLdKPnTH98kxRcTTEICOCldLhpAvX/wKWlfhYcHAhEbxxlLIcIYBH
         ETi5mqDiA0Udop/A12zd4rZ0Er3Sq6eNrdOjXPb5AJ6M65N4dg3+JVEvwYmqluf8Z/FO
         YkiBLWaBQThY4fm6vm9Q1ly/rGxpTNf1i84xHPvtVCUk46idUwzTiXyJ0kQY2yPN5fmC
         x2mhUWHVF/LRAPv7M0E3p6V4xBBpubdlZOtlE3rp8y8q1QLhaUThTKz4qSE3cDCTnL0C
         bGBayIImKC4ugrQGL6ByvloQU8aRuMWwW7iWcH2EQY6T0jH3zrHoOJeB7nhid2eeCrGh
         pqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780731932; x=1781336732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=soOeU2aKGw0sdOWk6ao9iMdkrGHwTA85Ix/Vj7V69uU=;
        b=SCmcyU9LWU+TgKK+wjnZ5hGlN312PcvOnoKzWrS4rOCnX/3RFgBleyTG4G/QIu0o5p
         nawShXnfpS/ZQNJteR9BbzLPmf/eGg/naJPZwgMR+jTvtwUKaFfn8mVW/HbF9/np0czM
         wMjtXmjVfByWEb3DF0PyRI26CbJP1KwSEjyCdD3SqMIZ6W9W8YA6AbKyVjdh5OhRvdeO
         ZwBN0pcWLUy4BitztG9HzSucvYxlFCMCnVZS9B0DDEmOaB5pgIVhVKP/Lf4BDuGOuCa2
         X3Lyr5jpmdzcgAPvMZFKfqq6mLfi4/0krK2PuujlcQgUcL3DAo1+2r0s6iIkzzkkgGhS
         7KLw==
X-Forwarded-Encrypted: i=1; AFNElJ/p2qvrFcuw/EQaQJ7tevhgZHV6c47QR4y92HqafYSToQrNfGD7ucJIH4sHG6gtuqxYNRizSlX65FVD5k9+38A=@vger.kernel.org
X-Gm-Message-State: AOJu0YywkMXaNl4hGzpM4j1NFDzXro/GAuQI+ipzwicrF0ncOosH9G1d
	+FgrYJ37P/IihtuRDMtjEmTDsTftz7Az/EQVc2HFOpw/c0+omgQsKIj+Q9x5OL9pov8=
X-Gm-Gg: Acq92OGEPkkeWWXlr5nB4Sm0ttNuQdLoLhp1dARilPfUTtSJjUtlb9ynyq9QYtw6FIX
	n/CuJMvXRZvO6ztjsfSJtbIkoK1HtANe4Eurk8BL6bQpzYJG4dkgFL9TT+VrzpxDRyt2XOmRV+0
	CK8n6mWzhHKn79OA20itdQGsE08XNJdU/TIoJH0kc+X3xiGEjC0sHpwhWwa3J8q5srwU59ddSoG
	NQIg57bIWGAzgDTSleqrSmDc51IZPvkj/Y/P7pZ92UtEY2S6pg3ok59pTRordPwolZPU6UR0XNJ
	Ix4POZxO31EcZG2l61UpOjINYpLFWBAaaMEB9/Cr/NyoRlH12JsZYAl8OV4iBF5xG2yHRdbv6eF
	SIeCtnZXfGUU9gwEeJGRc//s1LjERxogjW8dZe0EwgqNDMD8rVMPCTuqgZn7jJPyrtV6ONo7awd
	u6rT0bvAH6y1OguiwufbeyB/8Dih0AaagqCWygsou6HRpneTJA2Q==
X-Received: by 2002:a05:6a00:94d8:b0:832:e65:ddcd with SMTP id d2e1a72fcca58-842b0f4278cmr7095141b3a.45.1780731932077;
        Sat, 06 Jun 2026 00:45:32 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:13af:61e2:7096:38fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828821d0sm11350990b3a.28.2026.06.06.00.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 00:45:31 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: stephen@networkplumber.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	hemendranaik@gmail.com,
	horms@kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	tahiliani@nitk.edu.in,
	vishy0777@gmail.com
Subject: Re: [PATCH net-next 1/2] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Sat,  6 Jun 2026 13:14:32 +0530
Message-Id: <20260606074432.22005-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260531154149.592bb35f@phoenix.local>
References: <20260531154149.592bb35f@phoenix.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 May 2026 15:41:49 -0700, Stephen Hemminger wrote:

> Sorry, you can't change the kernel/userspace ABI like this.
> How will old iproute2 handle new kernel and vice/versa.
>
> The better safer way to do this is to either extend the
> existing structure and have iproute2 know how how to handle
> short (missing) class data; or use another netlink
> type for class data.

Hello Stephen,

Apologies for breaking the ABI.

We've been working on two fixes along the lines of what you suggested.

Approach #1

Append type and the union after the original 9 fields rather than
inserting them at the front:

struct tc_fq_pie_xstats {
__u32 packets_in;       /* offset  0, untouched */
...
__u32 memory_usage;     /* offset 32, untouched */
__u32 type;             /* offset 36, new */

```
      union {
              struct tc_fq_pie_cl_stats  class_stats;
              struct tc_fq_pie_xqd_stats xqdisc_stats;
      };
```

};

tc_fq_pie_xqd_stats is currently empty. It acts as a placeholder for
future qdisc stats if needed.

With this layout, older iproute2 versions receiving the new 64-byte
blob still see RTA_PAYLOAD(64) >= sizeof(36) and read the original
fields correctly since offsets 0-35 remain unchanged.

Conversely, newer iproute2 versions receiving the old 36-byte blob
take the memcpy path into a zeroed local struct, type defaults to 0
(QDISC), and execution falls back to the qdisc stats path.

Approach #2

Leave struct tc_fq_pie_xstats unchanged and export class stats
separately as an NLA blob via gnet_stats_copy_app():

enum {
TCA_FQ_PIE_XSTATS_UNSPEC,
TCA_FQ_PIE_XSTATS_TYPE,
TCA_FQ_PIE_XSTATS_CL_PROB,
TCA_FQ_PIE_XSTATS_CL_DELAY,
TCA_FQ_PIE_XSTATS_CL_AVG_DQ_RATE,
...
};

Adding any new stat, class or qdisc, is just a new enum entry and one
nla_put() call. Old iproute2 sees an unknown TYPE and skips it
gracefully via the default case. No struct versioning, no size math.

Let us know which approach you'd prefer, or if there's another
approach you think would work better, and we'll send a revised patch
accordingly.

Thanks,
Hemendra

