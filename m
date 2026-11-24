Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556463;
	b=z/6YukB5ikv6SSMzMg7m5f5Jjb7sHUc8SyUqWODFa2+SsbMVyp+wN5Ts6JtiknZ+wJr5
	 8aSoudwZGuZk+/Ex+byeGLduIy5/FbT5kV4gGXYoVT71SD43lhU7Hu3FLfk3QzlwmmJIR
	 wZIZjhJUZTGJLX0XphxFsCEA/Gs5SsFc/sw001OVv6wGojqS9Ai+nsNdJzzjjyhcnT5u8
	 mP9h1WBn03tkRodZy5jS6foKWYAcEXDfXY1ZuHDKQJOy1SJ6k5f6kaocIfE/0cdNse9ZE
	 4u+gzX5AFnfffNC9omkqWcs/SPZyOOtuYrAqF5x20ZnIwJM80tModPS1nM/rAsMu6Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
	b=uoF+TTJNCvJGhdEKX7JuQ0cmqRO9seqRRls9SmKpLh+4tTDWmo250q35IOstCzX2w+wC
	 Dc9io+a1vsNAKH6cjmJ1jJ0iT7clxTy7cksXVIPDInmcAZrnPDHc5YWfZQGw8bivEVglQ
	 7QkurLOCrHetAd18AelGvt6LaS87RS4j6N+nZyFueO+5osAdNOoe+t0niK8fh2zABssUi
	 wQMA++vbDzQxrSVQUV5+nBBOU0rmbUJhavZJbwHnUNjgoZpEwGsv3ulKl2XXyACFXqkmE
	 oS+4oMTFrUve3f4lcGGSeJpIybNLtOT1Fz00X2xMET4aQNNrt0JV98Y3TiFfhXrC2/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81A7606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81A7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3dd785f65so343469f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556461; x=1796161261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=Vbh6Go9QrB6H0Ci+ICfsnVc/Vnpu7Z5MeztCGu0guAbvGlNHsrrPkk0VY3N1pD7MHC
         VheORaOhmiPJ6e5quiRTYcJm5iS7zGq+1Sbb37Ae74UDo75P8sxw/QyBrrTAoVpkFRym
         4sN0CqvmxdOnDEXqASm05sl0L5co+sBDSlRInJOxlAXsoKtWpDLmJ/DhPMlt4FqWJDqI
         Go6Y81x/DV6JJexZsaXT39ZqhZ4lFAlfA9BUdf4N/IwO7ncpQGwUBclACpDn6fhpL4A9
         icVhYxkXAUfD+s36UfHnwhkknLYY5slL/VA5KajX5FgwI0lPvYUFloKHo3eDGQK8vG+8
         E8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556461; x=1796161261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=WGnNQnewd/qg5xkO54Yt7XVkw7Zzr0gWfpNQPhm5xihMMlvflgzo0W8iMB+DDuWG3x
         DoECFG4dmgMSJHq9vsMGRHEA4HEGSBWCzJ9LaoadGAa/FXYcadCDNJpRBglYTRYEgYe3
         iHhrGU9ijt8pi9VRie8cpSGmLC7ykD0PiYTxiyEey9evUh8c+3qqf+aaGiw0V2AsVBSw
         GbOhpD88Y3pVnMjrjMcpq87nMfQy0lxDc/r+uQKdVvcldIUeR8qRGL+DiDF75wx9JaAv
         MzSGKPevZ82PR6Tqr+n/nM/AnV6gPLL2BoFdNRpgAsgjMfFAUDErMJHkibsLAJXUZXir
         NB6w==
X-Forwarded-Encrypted: i=1; AL+hErFt9XEkijsaigvrxETVhzP4WNRAVI4dHfyBKD/b8YKh3S7u6b/uILRpEZzL2uKwpy9yn90KX79zmPM3kS6Xnko=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LnTgTcm/jZ29rKKN87hOujpX2GbQDKj+BnEMU5IJwXBky8ke8
	cwmtwfj4giCEdqN2bzORmgG7omsTuqd0D7igNpg/GtCg+d5xN+w5QWtz
X-Gm-Gg: AZFdTZeanYObOI+1FLIz35wfHQH4S8lnInxwAHw34/N2ENxYlYNjw/lG4VCoqQhpvy6
	BkiWQ3jOf177MkQtX1HdGHdk9VQfB5XIRU0VBz/jGzIsqScABxcgEd0g/ejrOIFuLJjDuY6NtVm
	RAIbglO4bl8ZEYd79nivozt81d0ccz1H7Sri1EL1n7WGsZr8mvm8eRL9+VE7zsSFFN4uJnWqcnd
	GMDOeka1bzAcXxhFnRx6dhCflt2O31Ha0nv9beZIw3Vsr/i7nA2URgWrRDhMLkiTFyrtdUCndsQ
	unqNjVCVG2IsjgEYMDKjlaPNaeGS13zZdaNeTLL6GYowwjkgFjk3C+tDw/umVULKkC6v5dKKn9n
	l1wEF/IDjhBKSeqpNy28bBF8Z/CQ+gdV2BarsP9BhshL4wdRgT6V4fP7P53F1cccZ7H/AdpN6v9
	Cq4YgF07oWYHLKa9DWJXHjOEkKr5s2L0aWAbOMaMtkoLQYZFhsm1++j6WQNjoIeLfL+NuJXoIJH
	JTGArlZt3T8i9x2FxyjYMGwOBFaGCrtDFGHIE2Nukg/sr2XrZpZT0UV21ZvEOVIxFMghctHtm47
	vgBjBIOOyOcigvIN4Mizrl2zys35v8IJuiPTsFBLlsVVJruY0rrrcUsQ3jcmqh2aW+2DOA==
X-Received: by 2002:a5d:5888:0:b0:4a6:d298:832b with SMTP id ffacd0b85a97d-4abb6095e39mr30672204f8f.6.1795556461284;
        Tue, 24 Nov 2026 13:41:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:41:00 -0800 (PST)
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
Subject: [PATCH net-next v7 2/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:25 +0100
Message-ID: <20261124214025.11603-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
@@ -473,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
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
@@ -483,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
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

