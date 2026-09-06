Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62E930C618
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788665205; cv=none; b=hWbESWFihvbYNHGNdtmGECB71RV9Rt+Gu/eD45wz5RuqYp6mnnLLuwHGqZIYSw/l8tiXKeodpV6L0v8zigrby3H4PbhlhtbfwAsJaJzwxj/HdPag79cAM7JzrIPqYYrhqGA1CWbH3jgk8RqIPO9Qzg57WIAQLGNG13J4iWGJzZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788665205; c=relaxed/simple;
	bh=HaOzQHX313X1yQaDOKp0eo5ikSMTw8qCBf1ZSYAjO40=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=LwoI3Wt2Qxq3q42XMxQiBM4KZSd3oid7eZh6nCezv7q2QhxD3Sdf/NLkCfpZV1KOUR2iT/hu+nLg/byTzRlegPaiMRfHAUahoDBzlg2v/lbwmWPD1vJSPvnACxlag0MZjnLZZMg5lkcsiI3+ppUW/Pct2NNz8RgiJh9SM70Ivvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5QYY5ne; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5QYY5ne"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so2543377a12.3
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 20:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788665203; x=1789270003; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/astEwZjKiSMcP5MKwaCmRvqZ+Wy4x/f67q3s97iOn0=;
        b=A5QYY5neSCVSNoL7EaQAD8/LnWaysUxNhmdtDB8PkAayxSTfDYsTHLnXDnSWAcZjcS
         Wq+5KG432CaX1Fo4OGQQeubgRaTL7hSqxlh07BeVusKl70+l6AgG+cyTZoT1advhABsi
         C3zJpq7124c2x+Sxh2gtWElC6qiRD6gPVU0A0nhMU2hWMY1t7GtUiGvSdU4AFPAhva6D
         tMJAV2OBhalkk1qaCEPWkPelvIejtFluFIEtEkhwcBhIWijH08IFweVtujzOIjo4HpYB
         TMfF70f+co+sqWaTTTvEbNJb5hfkUXNBbWWHCOY0TAZk5wdnRDlQNLFATipnE7w4IXSf
         NyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788665203; x=1789270003;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/astEwZjKiSMcP5MKwaCmRvqZ+Wy4x/f67q3s97iOn0=;
        b=kKWpyERrp35BlLyxgBLei4ansUAbi5A5GJuGM7Y1YBFUZt4aDioMuqr0dS8Ub9RVKz
         zl9ykyjOxdjTdGRb1VQ/RdPD+6oTOTvnEUExpmZ8DthcNq7u5g20D5idPD1RfArt9Vvy
         1YnnB4CxMaGhBkyNruzgAx7iKkO2Ck1hQxat7/xbZMdQgaMbEirxN/P+kTZe2A7h5rqD
         hamY+5kAgKKp92DhD4EfMqqNRjFhDasAID+bXXk39+4WLtKshqoB9owWeuc0+/s4XC7R
         yOJYPZNd0HqoEdk8TiALfggihoBFros31cMTzjJ9/IaK9UNiS6iOT6gZYbJnnvHov9RQ
         BbsQ==
X-Gm-Message-State: AFuF++lh4Ir4yYXrvG71T+tP0Ko5rHf/dU36nQ1Qtpqw8rblY4rWhcKQ
	Mybafgz+X5fbISvtyJFJoWQNl6TfoEOdlq2CAba8k68L6vEo0Ij2fJns
X-Gm-Gg: AYBFou25nqEZYdrXhHYbEjlbGvkhFuK+LnjtLWFZFTMVmfwJJ30FTrl8/K/gZcbloJn
	+Hc27phR6qchriOkq89kzN0IH7CbjOgx++K9sX9Speb0c++QWxLUulMolKQE0cQ9NEbsTF7KtGC
	++YqI7RpgKOR3X4yASN24LBZj/UvnQPc/vdYa72r3IwSsBOq0LpKxQeQJ9KGu1JHcn+lKwqoMei
	XUwxIOpMCWqOdWP9u12A9tHNsvX+LEc+Ij3YT7NDCJdaGb0j8U7gcCHNVQ0PzzfI57IyFLkWzBS
	trGc/q/XWsaLuONbgFPjUvS9UoZpVlUTy+5iSUV2GGDYyur6sHtYb+3I/p6VgrMVb2/RvpXfhRX
	fmM1IMA0DegXj6dQ6T/OBzOGgeLAHIwHgLkA9nA4wduda01jZms75qOwaegeAGho8OhnAMAcRU8
	69wcedGWRktj9bdSlfuqce58mnXcc7ZwoDf8ImjkZKslHy8Z8V0FueKl+NeGMRL2S0PSzTigkRH
	5IRvJfaWmAYuc/N11/8kgADpC+w8qTKLpoDXjT/YVhLAxvovgV/4cu1
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr24428059a91.24.1788665201498;
        Sat, 05 Sep 2026 20:26:41 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm27645816eec.16.2026.09.05.20.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:26:40 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Pavithra <pavrampu@linux.ibm.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, pavrampu@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests/powerpc: add papr_pseries test suite
In-Reply-To: <20260905182656.993870-1-pavrampu@linux.ibm.com>
Date: Sun, 06 Sep 2026 08:53:17 +0530
Message-ID: <pkyrxdui.ritesh.list@gmail.com>
References: <20260905182656.993870-1-pavrampu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>

Pavithra <pavrampu@linux.ibm.com> writes:

>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/Makefile
>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/dtl_test.c
>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/lparcfg_test.c
>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/papr_rtas_common_test.c
>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/pseries_energy_test.c
>  create mode 100644 tools/testing/selftests/powerpc/papr_pseries/utils.h

This also needs to be cc'd to +linuxppc-dev :)

-ritesh
