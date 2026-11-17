Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935465;
	b=RvdjeLSkWva3WnUVt1IrOFPNW68Yt7Llk4fQ2xMf9Q4QIkxHgURjm3KuLnWgEMcvT3Eu
	 V/f0jEyJFFqjYEufF+LcxKjzvA3ow8EfGycYY4jHzhCiERw9jJ9mkv1nuhDKUV61O0a4x
	 4gArOKXiXvVRk7dw7R7TFjP9n3LSYNM9gUKZquBC30zlIWY2WLjcH9kyCICZwrYNh9vui
	 T5aji53rHhJfiXSyOnie6+SghAe1Zg27LX8OP2XpdXXlaT6dtnJsR9Meu6DwnfByf7dmB
	 mEbR12xwJA3Cp7/83FJaNijdvnyieTqNVPm7NUb/TjpfPUo3iTRNkdVQDJrnDhlCG+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=owy/m3VamIQG3Y4omPOAaj7VpMKOUCAa/WXa5LnFHDY=;
	b=oU6eQyDy+DcjVjxY/HJV3v7uHYjO4HH5yOUqeaEBywLK7Ts8oNPbizbMU+Wo1LfGaPjv
	 H4IH3EOxaHiabMOWSKVZamYZhLlpIc5IKAt+f2XpeTNHB80N8YwxfFwdjSOtpEAu8clqy
	 dE8aRYWpKA5rtf6V/13fHicg0OI1Lc2dlEChBQ7hGPvolE3Uuvm0fGhjL+HaIXGnPExX8
	 MYt3xiFwraoKERd6g2/91UbZBQDEzka2FrriqWimsdkykd+UMo7pY+70xL22bTEH1+sax
	 qSqEK//XhjGusRfhtXef1/N5wLVePUsRozUkEBhLqpeDzZWT6J89Foed9nnLeORSpOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN5drvih;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A5606A332
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 17:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789A5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EN5drvih
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4944a0eso57507c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 09:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935465; x=1795540265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owy/m3VamIQG3Y4omPOAaj7VpMKOUCAa/WXa5LnFHDY=;
        b=EN5drvih5OIa25+fFdQ7lIMB1oGDdMK5lTY34kIwHKkjRbqyVSB6VMXdMOAL0r0bY0
         1eCE825wmx0tVGfMAAE7KYmurtHa7vY8r3Lvx/VRT4+erdE405kzQUKhoZnanFEkUXyq
         fp1tdbQj0m+ox6H1RDokGGYfGlJdK4uV1j2G+lkUzxLokfImVFuHNSch/vlbS7YK3gRj
         WY9KfLQM1LYULdg6+MzFDaa1OlB2WqVOPUeF7EI9dXjJxs5A62xQ6ZGa2z5Z5i2Tiq71
         1Rs+Auq7d9v1856SEoHGyggdy0QueQDksyn8zLKwNfAhjPV2r+l1dZD1t3i4uzs0E1bk
         QSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935465; x=1795540265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=owy/m3VamIQG3Y4omPOAaj7VpMKOUCAa/WXa5LnFHDY=;
        b=TITUTDUHES54q6eF687Iu46wsXXnAafZyVNxtnGDr0YxZaNgDROZmMmurjs8g11i/W
         yTJtLA/u4h65vyrRLBLIhQhz6XK8i4HOMpaVczyiwMfTn2n3SVvWlJIVuhH8ug0FBIsd
         6IhCYra++yPmXfOwEb302GeR5eAz2+eD4hH0riThALOHZNBBasQA5rAFGnhkUkrscd41
         6toIZflUjamYBagS+QA1yD0Ta8zaoSb8hraUspCfcMehjkQpwcYGgdffLlVgC6e2d0Af
         DpYD/8sOsQ+1lAlpUBlMN5moiYFtSzzeg7LFieth5xSM9wX8PkGLshWRze5zY7YIaOlX
         YUKQ==
X-Forwarded-Encrypted: i=1; AL+hErHpMdsLWxUqx+2vXA7yxM8Kcs1vKXJ6Cex0OZpzp9sDjYZS3Zp7LuAltKcnCpRVBVLR4pCvtn52OuWs8+JmhsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z91FCERw/7hc7WAWylvfCaG2sbsGlT95sOKzXjrPVLbeHXrNhdS
	D2BoFKQzo3LCePtR24+FWnHgb/7+a1xpd7d/hmNEbZZxlJjFf6SmiCxo
X-Gm-Gg: AYBFou2pMq3FoWgZDqDBSetROSiPMuKt2JoZvcV+07xG09aGQDUKiC990p1Y676Q3Zs
	L9l74FcW9E/GnLx4Bk1yxH4+G9u9jirwup/uqCioAby7Y2z+eXONQ90Dim3NFBQGKLRpmhtLEAx
	5Hx/+VbUs4vvi7rSOxcqGrK0buXObwlDLT0qqiI6+LXJqmWV0udfEphAL9xRicaE/AWoOYg/Vf/
	XZMWFPcdKFSR9S31Tg1SKQTBb1+aCC2wkPV7549cgZPW/vC3wLtt3VdZs6wzD0XQYPuGNcTmn0p
	7f31/KeBnctDIw3OWMnjNRSjwBKiwLhe/0Iq0Hl5d/5+fWEPxnbaKu1OMVhxW3lafhg65TPoG18
	jG1TWTyC7t5BolIhJGNgOh39vzWEsQcxSLLLYyMom5twOhQDFb1/Y0ork5NZJ3ED5AU/JFVFbbd
	Sf+hka1cZ0QFut1P7+ZvbWd7sW0AtQ5grOoI1aTEWCBgijHXg7bUEm9APIl/p8thjpYqKdMfobV
	eSpp2oUDsPSoUYGnq6y8X3eAOZ0Pamk8RMYz/pbbhoX4s17fPjvhGs2ADOqoQEKrHM1fJej2hgO
	Nak4vyIja3ufdZiTkRrZAeffyMRko3WCzD0lj2tXSHx2dw==
X-Received: by 2002:a05:701b:260e:b0:166:f097:6f12 with SMTP id a92af1059eb24-1b543bb5d5amr210005c88.15.1794935464283;
        Tue, 17 Nov 2026 09:11:04 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm35794982c88.10.2026.11.17.09.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:11:03 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	netdev-bot+sashiko@kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 1/2] net: openvswitch: do not record user features when the change fails
Date: Tue, 17 Nov 2026 12:10:48 -0500
Message-ID: <20261117171048.1732084-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179484682026.3136.13753538826492049125@kernel.org>
References: <179484682026.3136.13753538826492049125@kernel.org>
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

On 16/11/2026 16:33, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High] Can this early clear of dp->user_features race with
> upcalls that are still in flight?

It can, and you are right about the two reads. __dp_destroy() runs before
the ports are detached and before the datapath leaves the list, so
queue_userspace_packet() can be between its two reads while it runs:
OVS_DP_F_UNALIGNED decides whether the skb is copied as fragments, and
pad_packet() reads the same field again to decide whether to pad. A store
that clears the whole bitmap between them can make pad_packet() pad a skb
whose message was sized for the smaller linear part, so the padding has
nowhere to go.

Your second suggestion is what the respin does. __dp_destroy() now clears
only the bit that path was already dropping:

	ovs_dp_set_user_features(dp, dp->user_features &
				     ~OVS_DP_F_TC_RECIRC_SHARING);

The ovs_dp_cmd_new() error path frees the datapath without going through
__dp_destroy(), and it writes the field the same way now, so it does not
open the same window from that side. ovs_dp_reset_user_features() still
clears everything, which is the point of it: an outdated user space
instance re-adding a datapath is supposed to lose the features.

I took the snapshot for the older variant as well, since a set can change
OVS_DP_F_UNALIGNED just as easily as a destroy can.
queue_userspace_packet() reads the field once and hands that value to
pad_packet(), so the head room and the padding always agree and a set in
the middle can no longer split them. The setter stores through
WRITE_ONCE() for the same reason: the receive path reads the field
without ovs_mutex.

> Low priority / nit picks for your consideration:
> - The patch adds `exec 9>&1` and `ovs_fail()` so that a FAIL prints
>   its reason on the real stdout.
> - The patch runs `exec 9>&1` once at the top level of openvswitch.sh
>   (line 52) and never closes it.

Both are gone, and the fd was worse than a style problem. The daemons the
suite starts inherit the handle, and the kselftest runner reads the test
output from a pipe, so the pipe never reached EOF: every subtest reported
OK and the run then sat there until the harness timed out. Matthieu
reported exactly that from the CI side. Those messages go to stderr now,
which still reaches the runner from inside ovs_sbx and is not held open by
anything that outlives the script.

> - ovs_dp_features_check's comment says "A show that fails and a datapath
>   that reports other features are different faults, so they..."

Rewritten in the respin, and it turned out to be a real bug: ovs-dpctl
prints "No DP found" and exits 0, and it leaves the features line out when
the kernel does not report them, so the check reported both of those as a
feature mismatch. Both are
recognised in the output now, and the "could not run" status is left for
the CLI failing.

You also asked in the earlier review of the series whether the return 2
path can be reached with the datapath missing. It cannot, and that is the
same mistake as above. The recirc failure should have used ovs_fail rather
than info(), and it does now, as do the sets that only did "|| return 1",
so a FAIL carries its reason.

pw-bot: cr
