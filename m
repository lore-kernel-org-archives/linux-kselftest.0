Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66335F163
	for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787429503; cv=none; b=FKJtk+Ljef3Z7nZFZYEm7o9FBa6WuYmnHLLq6pdEnY1fOKj+fQfylQXCPOG90k2K4k6uzjVEM9TJjXc7+N+LbY80PPDLpogmY6UmYYLAJ7dabAmTQ5h+pvwo/+4RTYoLowBIjZdIZQMuwTi1tHnu9ZfM07fTCPvbuAnfBcrnbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787429503; c=relaxed/simple;
	bh=gY8pFX7eDDeZz3RXVa7ARwOLkXBhrB1p6G3Gx3Zy2o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMjF7CJUgaNDwWAWYUd7O1964UeZn9NiSB+Fs4wXtjBjKyFtfPo7XOuL2tqUEOLWr+mGKMVZ/dRXrhsqDWbtzuEYYSSmwBUYx3dUnIaKvTo7QkuFeRo3wsoSN0LaHz5GbB2E35/1bv1eQhMk23Wqo7rDVVgu+BgFgt+PmaYf6Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=HzRj1If/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="HzRj1If/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso223622566b.2
        for <linux-kselftest@vger.kernel.org>; Sat, 22 Aug 2026 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1787429500; x=1788034300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVtGEBOLfPUf9fsvzZfuQ+GouRuuY6QxJu3hiEIATS4=;
        b=HzRj1If/WA4D0QKLfuosG/1pRewvCW0rfDBmX5T/egvaxIoKoHY2ZsEzb3eSxSm8co
         O+4gyETdxElV1c6uDJM0tvQlSue6yYzKWYH2pDHu7co50Y0Wa7OwJDEXfyYvICaCy3ym
         gPJ6ZyPQXEoFRsDtPVr0+YqMCHnuXqPtVq6XKmTzsLM+RsuZHmHxTf1BaCNuDEGcDklF
         Aj/IhNrl10XkhCfldI2C7k13A16I23xT4GmqDnV1b2ntr0tsR4LNnF2ZRhkOuGP0Gubj
         i81LAxCS1O4wGmH2AH+b9C7Ucv/lq7yCt2TxE+yY9WoDQ2DgFDPqOEAM/ol7y+aayxk3
         LIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787429500; x=1788034300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVtGEBOLfPUf9fsvzZfuQ+GouRuuY6QxJu3hiEIATS4=;
        b=ST3walkILWPNSEuPPD9t+61JIJL2kmPVfY7tAmjPgPr87UaqCLTL2GMInUnMyHmMlv
         BBngCQxOHOvRZNB0YgorBi6yPiUGNQxRD7JhvrejD8xheoQLxEZUcPBVH3633H741GlU
         /BrkctODzukOcJy6JL/eHbYGbNCWK7aYm948M1KuEmDHqjozEXJHWB2NbVi1x78OvLoh
         9NRUEtnJtJs1MuUdO04FF4J+MpTwTqs+u9aP+GqmkOH1qUiHW21PdrwoBzGYKlHyMHfq
         r/eEarCYcLdYUhFc5jc81+EdXyV3IUqGaPujAKjo33H0EWJgGUjPEE8vxaGzNwS0qyx0
         zYbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpr6vrpMT1k8DybWtj7tYlxd72JZy3W8ivsFH3Qez8xjfWh0BmRegpgzbJctIMOSmOjw/pKig/dLGd68a7Hq3c=@vger.kernel.org
X-Gm-Message-State: AFuF++m0UeWiAr7krryeA0bSqZ9GgpNKjAzetFkGDAEfiHMk+4UnwW18
	44a1UtNz5A8ZYi9xeafRlFuwpgwIWMvqdjEUkuJ0dnXYgWOcyFQqQ0iPDyWGG96YiZU=
X-Gm-Gg: AR+sD13x0TfhTbnCT4apkyEeNfWvOA0CHdwfi5Qzxo0jBSE8koCRJmuoKk5Z6GUEqaa
	5lRWVOpT5I61yO4yBEsL7dsIc8cyOmMhcc3vzTXGsluAtmIc08FNUCqC9fR0hHq39C7W2dt2gz3
	dAVP79gpjUWa4oWr6qibG/V/GCvzfpxI3FvT4P3E8tKdJdL+SsyNPL1B/QOGZJMu0QijbSuVMkJ
	NlvfPSMfbBbN4H0AhSELKSsJDJ8toAxHGMxPLloUcFalRQtqChQcqsHrpJLqb35Y0o9l7+1VpQf
	4pYX90VUOWrS1cKXM2yzL5ters0XwWFco3ewC+NjPt0IjDS9qI4YWuBnUznnQuaS8B/jUm0mi/8
	bk04Ux/XkmPi/SFmfF39+tC7dMlNn01xrWAjXpHG9arLaeapej/T8xII+Vhk49RCuL7ZQKhOaZU
	IMRIaXPnvVyn+WCo+JCc5AC/yfgXSEGkHde+wnpfEIaDjvkpoS0YQ/po/vvQYIDTv9nFkC/ADWZ
	21zmlfIKQWVjyUgnCHJfHPAq9oOcAZnmDCoh6znOBlfc6+qbYpKHnxwCFmtnA==
X-Received: by 2002:a17:907:3f88:b0:c24:8e4b:2baa with SMTP id a640c23a62f3a-c248e4b347fmr961860666b.15.1787429500178;
        Sat, 22 Aug 2026 13:11:40 -0700 (PDT)
Received: from localhost.localdomain (chello089173060039.chello.sk. [89.173.60.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f99basm444347766b.37.2026.08.22.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 13:11:39 -0700 (PDT)
From: Rastislav Szabo <rastislav.szabo@isovalent.com>
To: netdev@vger.kernel.org
Cc: edumazet@google.com,
	davem@davemloft.net,
	dsahern@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	dima@arista.com,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 1/2] net/tcp: fix TCP-AO key deletion in VRFs
Date: Sat, 22 Aug 2026 22:11:18 +0200
Message-ID: <20260822201119.272269-1-rastislav.szabo@isovalent.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TCP-AO keys with TCP_AO_KEYF_IFINDEX store the VRF L3 interface index in
l3index. tcp_ao_del_cmd() validates the supplied ifindex, but does not
assign it to its local l3index before matching keys.

As a result, deleting a key scoped to a non-default VRF always fails with
ENOENT because it is matched against l3index 0.

Fixes: 248411b8cb89 ("net/tcp: Wire up l3index to TCP-AO")
Cc: stable@vger.kernel.org
Signed-off-by: Rastislav Szabo <rastislav.szabo@isovalent.com>
Reviewed-by: David Ahern <dsahern@kernel.org>
Acked-by: Dmitry Safonov <0x7f454c46@gmail.com>
---
Changes in v2:
- Add review tags.

 net/ipv4/tcp_ao.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/tcp_ao.c b/net/ipv4/tcp_ao.c
index 5094267447ae..26864621e6de 100644
--- a/net/ipv4/tcp_ao.c
+++ b/net/ipv4/tcp_ao.c
@@ -1834,6 +1834,9 @@ static int tcp_ao_del_cmd(struct sock *sk, unsigned short int family,
 	if (cmd.ifindex && !(cmd.keyflags & TCP_AO_KEYF_IFINDEX))
 		return -EINVAL;
 
+	if (cmd.keyflags & TCP_AO_KEYF_IFINDEX)
+		l3index = cmd.ifindex;
+
 	ao_info = setsockopt_ao_info(sk);
 	if (IS_ERR(ao_info))
 		return PTR_ERR(ao_info);

base-commit: 746fc0787f616da418ffc04a110296fe95d53491
-- 
2.43.0
