Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285681;
	b=jKVeqjOqNInK3MbYoxc8mQFOtcIyrE5p9Zs8wVSrid62wttUjvkczCbVESu9BwxqIrko
	 QUQ7mcEUsbUqFMFjIfq0R2E6pf08doBXHmQ6sgOsCbA1l3pnQBOSu6YTFXBwEeAJ4MDug
	 U2LC1lqYkmEhkNI8sNl57OIRkbEjAG41lZIltlAec4f5w0wzqS0y96pOyiZYJVvhy5RJ9
	 4VpxhPIzropcVCjnSYgxkFhk7KhZTM/UtG0Gsaau5yc2Vnq5fFsS7z708atf4f4cPyImc
	 x3//roHpvK7S5NEm0g5aW9AMyeHjYY764timwit47Jy7cOcNyjWaeA8iKbxnEBDkScQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
	b=oRHLWRXhHI09fBg7iwqr1/bp/ailroiSx/1acKb/CE8tYD+0FK822xzjASJxXr+Vc+Ai
	 eXruYLUn8BovWE+5SrCY0p0rqxSWKX+97HZDgZQnrKoyloWbTvn8ZPltTFiYtH4V+fVwm
	 GSLlyZ49Ii7uvzN8Ot9KZOT1Cg4uFM6Pf9gf2E2veJxcuy0pukJGIuD/et/rPPYrWI2Zt
	 6JHGHmYhspY60BVcLF5vAXoaELT+XZx8tO5iqBvq3kkJIyz6IBAZOCI29PDAwcBQFUZ0m
	 ek7rayxhNjohsI5Y1U8wEiwp9q8HKOBmwm1kpi5cggwGehPD0Vb5vYZ4Kdzdeqv08gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1B606A330
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD1B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5e3cbf45so1617535e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285679; x=1795890479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=nyMluaa0J1C8Evy34JB1U2I9D51Q8jV2XWGP33Q29wwR04CdaApUHFGVZ2CgDIlzru
         6JtGhIgueKLnH8bgq4caltjkpVzFJlDPCnKVJp3MR6DXGXe933oVBlSg2XJKdhtgD9y6
         8ZDnyTSpLzDB15hwFqy2tPgVOVY2zXmdMPG2Nv6qlJih+3q+3wcN4Ny6qm1QUQvl2C3F
         hg+NKn/4Zn4b0mhLm8VFpPrvJvhoGR/IL1PBlQUZZR83ssKIcynL9HPYhajsYO9E+qlZ
         s+EL0mbWGwNTx3uSimOvIAEK0oLNMwvjW+ejd7sUdYqOrb9LpWhoA1aBBJidKPmRS7Ak
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285679; x=1795890479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=LWwmzaMgL9y6ktL4KK6tJRZZ+kAk9Z5B1MyTw0P8dJq7Sahq6ksdZUW83GhkDGZQI/
         OYlduBg6Dps7qClVehefOFXYcLgFsmp7wm6A2ptbOjd9C34sJAUqp78+HSvX/k9iP47D
         N/5ozuMkEOf3/0iuke1XNJKaeDvORF5l/LLhUcxEXbnVtw+aSEXil+RqO/7qwuw11nW0
         HXucIkvr7K8MSftzZp7Lt4bkaPiq5ez84VjVG5pLJmL0r9hpD7U+PAJwAgWlonLKlVeC
         Ah2I8l5jokHIUu7uu2DB0UnVJvC9nmCuk2amjAcgX0xmTO7HOiPzuKL8KN1U3guWhnbT
         s3fg==
X-Forwarded-Encrypted: i=1; AL+hErEsNMHlL+crM2Nmi9WTF5vnni4a3Ln6a6WmnCfH5eDLifi0CK3RUKOaD/kRlPy0aRHCcsUYYl8w/GlAF252RIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y4zWaoeUnhbbek2n01VHxizmQMMapuSx6YekXnsJiur6BLJNE
	L/sP02irw59o9DSGx9zSZgAqWc3tOSZnUvxcC/9+ipC80qIJ+nica1e+
X-Gm-Gg: AZFdTZeRJI5YAMTNaiovJWlhwPntCjXLpTRF47SmEpwNmrRILfiKg8wOqEUJo24q+e3
	m3khfM7+cw5mD3KZFP29mBINsUa0phpPPQanP6DHVzOb0ZFNh4zVLMHBDfyZ2ldEkbW0/m9T/Y5
	bEngQQOvaXReJF5/yu0ajbgh7htWkFAD21x6UmVgdhB8rpUtaGN2EFr0ut7TBfFOu0VPD8WyB5n
	mO2j+vAT4ypQusvMwOUQYrilPj0GIpv4Dxu6rR+QYJCCAWZckIEP6/9JRb9bp8y8nCjc7lScM8b
	Kl6wNBoXxuZTxfZFUk3VfJ3r/6KboEcVGp5JCHSedfuv8Xp/dwqCH4exEdw7sxWVNrlm1/jAm3u
	LK2spvSPAcDNeZksKNgRg2sAdqYTRh5BorJao3a75l7rleXb4RXLq3XGYhTMSU3UiObJrg9u0gz
	kAZcy9SAlpJiaWQICOgUSJrflmOuzV9MuwVIhcY8MThorIFN71lacrZVp/WGu2wNxySqJHrpl9V
	/n5RMb1/qjNWMZ0FOWU/PmHFLLlB+QaWXlBzM0taqu3vgrH9b43YX4AA5pDOjhOkcc8VW5wwKx7
	M80UGhT5VmqiyIGDEy4HjWZ5NIU0u7OEWv+7TxtDdkZMEsuNSaBD+5f7ppwFIR4X+v1RUw==
X-Received: by 2002:a5d:5f93:0:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-4abb400ac51mr13733609f8f.3.1795285679025;
        Sat, 21 Nov 2026 10:27:59 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:58 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
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
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Sat, 21 Nov 2026 19:22:17 +0100
Message-ID: <20261121182217.4609-4-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 7a2bbed0263e7..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -484,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

