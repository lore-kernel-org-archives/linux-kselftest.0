Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818497;
	b=dPvrA+3ydCH4l5pye3OVdLoWosE2VCXgXCASD4h2UrGlH+yqc0PJcBRXehAM67Gps1Ab
	 o1S3xX/7eu3cKWQI7g2ZbhQ7S2qz3xI6FiUh47wrsPeTOk9VjdIta52xcwImKw3p5sZjl
	 vEbt7AJOaJpX9N+HZt/7TcbxUeEj6CrAl3zFoo2lKgPPc/Vhuo5h7Jz4Z2vp99k9N5v1f
	 dqn1YHDnp361MQUJLdmOdHNhr+qZjCL4E3rM3154bewJBty3uMEpckGph+sBKKEzaz6ey
	 J3z1KwqxFIAhcfbW22f5dQm7y2McggKc52SpMLX1tWGk9JoiEGgAr1HAVKajfauPLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
	b=Zow7/4fj4FXnsunZompAeWvtE6QfkChX43fvrYyLJ9LYBIZZZLucrO1BowhuoiBPYhl4
	 TdwwXlBBhkyRaXpxaevjbSzrmiqI5iYplaEaYVn60J04HbqJAXfmvTkJA4Zi3WI8DlP8M
	 CHwQ+4uVaodAYlpNkJtgN+vjEdyS+sbe1euVt79R1vUqHjY6C98QBXScGpcnNtnvR45z3
	 E9B1hGUZbFMyDgMYnyV20RFbH5ZxV4ncXWxsftOobsbHpG2nlpryq4FY0hNZdDi8QA5m+
	 t/gm8Qvjuc73yGujYsRxJ6EZLzUf5HG+M5mulfBvl9WNiML4lHDHp1ojpc8CeuTwcAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6941606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6941606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP00IxpJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4946589267bso394371f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818495; x=1795423295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=ZP00IxpJab14kKuRe88DihMZ3sUGLLnAMoZbx6Kfw/eLGuEOaKx/tjV0jOXIOl3pQZ
         Uj7XXlwgBYHGEFZDvny58xVO230lxGiGvctM28rK3d+IBntRZxpQPLZUOUgw63x2iwKs
         jHaUfpoqubX4l80Db0RtAhYQ/O53yLrYu7P0rhfryHreBVsprNjewnuwhGfIzZTleO5w
         HSTtY+8UBL1aWSM+9/b3UwVyTx+hsoHZ4+DKhotoGZISxO8PgLuqLeUIY4M7Jo+1zMc9
         iYmYe4Sn442PJKjCzAbuRm9fSjl4FszpAWcaaeGvBntjfXbCVaYuRS/VmwAwGmsiAMmG
         Zrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818495; x=1795423295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3nMcjWv+xj29nx8pWfGlhho4ATOaCrbxLj/pbD7y/Y=;
        b=wezBv4V4uiXqui7oNtsMDQ6IxBQU1ekH1yHlt5nXpoYboIaNEufbIXPW0z3EiDBqdI
         J1iNHADDhkL0aj8uao0g7SrdBtpzkyJ14SHZLn5GFEAdah43I8I+XAencLJ7VjZYsMAg
         1ODGBCkWnctn262WSZfbSWlQseG031i8D3qeIGhikebutH0UyYTCaQHkvHj6GKuipUH5
         yVc85CKGMZZtevyRkEK3PlKqN9Xr71k0ceJBMrXTJVH/M4a8EATP+KhsFVdSSFwIhVdb
         WtG62wuybfAo/DjozM+iYirTKI6+gG1h0VL0POSo/ZO5irMf1T1GwzYjqQQpCoxO+txo
         QaDA==
X-Forwarded-Encrypted: i=1; AL+hErEpyE/HrdwVaSv0vz7CnfM/i9ppBSbbGZnUqvXyNKpV9qJrfonuXHcH6zRJLasSEM1V9XWMxj1vLp/6SFptXRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hl4NEqYZSsBz3qUhjx6GXjwt36N+I3462pUNzmEmzgWG2sSc6
	gSnI+NUO2CAkZUPvl7oqegpZiYOIWdeIhRRhL7fvwYVZKSfHq7Jocy6C
X-Gm-Gg: AYBFou19nkBaFkhSoOk3HSmjEPlpa6ZtBbRCz94q+JplwpSPYAwvxq2MIybYPd5F4aL
	hHUd+hjtms1a8G7Cof6VhZPFhnVVk76xtBaeqFCFoZ1xq165lfr4PwjVLTgXj5dR1fT4wT1R/xo
	bSFHcE5rL0rjktlnJY+D7gavDPN557L7lVFWOL0iF5114UnLxt8jr6v55r4pHRhPPRp/4LV+MmD
	TVHbAmmUJM3rvDnecpN4uoOM0uodOXtXOA/reF5hj0+JN8UYmZPqb4TL08vDuijr6JKsXXYgge2
	yCrNhYbmd1oBOsvsHN5TH78ZNFzDqtVzxIV7tuQZxYC/2r3pdZJiEplxPlTy7m2QrA6fw3W6by6
	3+IV5YBui6Oob8c0zBwm+j+7Aa/xTw21WurmxJ9YoYvh2F+SZ/kQWClADE0r0PxxnhqwkgEuagx
	J4WiBjl0uUuwBJjO6v2o+8cEfjGXa6fRD8h8Uu3VzPao4qVp1GxwhR+c4uiwLanpaMbKljeVJtq
	M0ZHJLs3ugvl5KUPK6X+YWjeqhk6EZN+6Y2ohVc8Hb2TfsKO/5M54DpOvfUgVkoZ2MO+2nOY8mz
	YkC0DDeE74G15g3kMo33w/BdXXUFbcVz2Hi5dddVZQuoEsIwdLSZv04+LCqEnfI/VtuiQP8A
X-Received: by 2002:a05:600c:8a17:20b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4bb5599b367mr158884065e9.0.1794818494950;
        Mon, 16 Nov 2026 00:41:34 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:41:33 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v3 0/2] selftests: net: veth: propagate check failures to exit status
Date: Mon, 16 Nov 2026 09:41:05 +0100
Message-ID: <20261116084107.6675-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four checks in tools/testing/selftests/net/veth.sh report failure
without setting ret, so the script exits 0 even when they fail. Fix
all four: chk_channels() plus the three "bad setting" negative tests
spotted by Tianyi during review of v2.

Changes v2 -> v3:
- Add Tianyi Gao's Tested-by to patch 1 (thanks!).
- Add patch 2 fixing the remaining three checks.

Changes v1 -> v2:
- Correct Fixes tag to 1ec2230fc721.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0

