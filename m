Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798239;
	b=TadNBN8pOKRDeH2WVXIpbYb3I3PsOnf+dzeSF4nWOCww4XWXUYlXJKsInQPRXA25KtzP
	 KcVKltx1fL4xZVvpVltrZRSgUhwwOqB3ouGHnbvqLemQNsODailfK/UgoZB2adObTE9pm
	 xUxvFRjc8ewcMFk998M4KR3NsBcESTRTStcjZB6LUiI0WDDBfoUaRC2ZagTEUi9h2Tc39
	 ZAs4Wvns/a5OY1pISIWpLZiLWw7n9WGBT0x1UTSE0ciZf/Vf3aqi8tb5qs1BBKohLe3de
	 vDCuHcMF6j0vnJ7rTf3ABP4K/LsK9sw020ySzKm3BLCuse5JJN6im+S4DR5GF6Yj07g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
	b=iqv1rB4zmMqo2VxPFXRK8Lx717bdToJiYDRVRIE72PM02xMYQPAE2qjzFax/7zbDPIRc
	 hbB8jac4E+/FGVtvhxCnwTrwPlLqsGoD8B5q6rRUeuyHnAWjhAFNAxQVLpLJLwIbSVY2c
	 y7Z4Bnvsa6typPRuDQRKiZEFd4SgReZotmU6ZdzoVfzT2wQ4WDNlpqZbiu0B6TPcsWWRj
	 vn0TFf5kQ+h/D0ciTNtFfEMWA2DejFb0UcVSsnL6wvkFiF+57nDqFc2INV8yUa5UuqvEf
	 eete+sT4l1S0aNDY7+zXK9Na+FuZ2I6z6Rt3hRQab4l2CRwt33KIeal/jeKja7UFIqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A4606A33F
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E5A4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37000e7234bso2179809eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798235; x=1795403035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=pe90he5M91kANyHpOtEYXLVei3WC1v6hnxARz3LPWc+ngmX9flCf8dFGhzEps3ActE
         ufnm/3kO5npj5GS90QK74eqTir8h+5vpLwfA+cYlWN5uLa5R0Szpu38UXMVtYEaQ+WdE
         55gAdIgoEzNr/FrMY/Z9cyO57SveUqLkRJ0/3KowgS4NM3jZmMDfn99HjuvVldswJs9X
         /osx5NMwRPT6o87+Ng33GMT36pbHNouP450qaHTrO0L+vAyCgeMbdvOT9KEYnBEf30pc
         yi0Q6qGdGesBF1xABj+cp52ZrvUd4Z7cLNB9eb8TCfXgRXz/pfHPvYsFO8sG6ISfRG3E
         0tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798235; x=1795403035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=IakZqWWT7J1AgL9EuKJnBLq40oxq9wyzwqdMBQnFxxVF5bDoRHVpOUyV1aG0n92R0T
         4twTZ9dAMQhmGc71hui9cDpS2vo8yyvpqT6hZFQYUCY0ca+G9f1d83mj2yD7fb56oxXM
         Ne1m8pxvXUQFvAWUxEb+WjBxpi9+1v9QGVUYBxJnahfo/k17xHmvfDjtv/LCorvDjF2C
         b3XnhALsaXr+a5u1+U4rMbC8vRR3QW2hXEhjszn7d1V80TeyEf4yixIOOS9QS6b9L3Ql
         t+oDsh6sKKJHUfqSqkPN0/JNWKf/ekCFjN+JyMldOl63BjEs30iAHUx7DW5id29frj5T
         YnFw==
X-Forwarded-Encrypted: i=1; AL+hErEEQZAa4qK737YsliJD7GKOWcdN7po+dZYKRF/b9f2syWfyBgynnntjmaZiG4LQaQRgmy/2tzjkbhN1EB4YSRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WxowtMoCO2CKzslUsQCuKvQQw0dWCS6zaT5MgDIZpUwNAw/Iy
	dtHH6Vvi5HeGwgHPN5e/JFKUtkywtexklKf7DGLeXesZQC2dwT+2YBW3
X-Gm-Gg: AYBFou1vk218PSRL75krx/6qBICRXgH1F1/1+5kqtMbZnJi2FoRiXt3ROJhLy4zr5du
	89MG/37QAsomr7lPXqIdAKxPZqs+ePORG16Yrh98LqdodauKz2mydwW82hxwtsKKox9KS9EteBe
	MYvbC0bRo27cnWZix5a43b5zSR5UeJ+V/DY2GEnUioIaTxqZn9uFFqJ/YkbDvyLh5qD8d1o46v9
	ZFzKcGkyPXlxZ8m9Qi6OoCJcRhDrvururzoMxm9RK/+w/cmACSsAkY6sIiXRU216kqRup5hqYo+
	3l8kzsgtXRweP+SDQOFXPaxJnbWeHUuwKBUMh+zSGk9nPxkXEXkZxG68MJFmdmZEkhFdHnEzq8G
	sLas+/8VpMaEiAJdCclMmgEmKmGOK4sVz/8h0taCga94ut0W4ow10iwqQP8Z45NP1gng+pdl2SY
	3Obh3n8AC0oOCoZu9TvgIXGDVPyfzERo5+Qr96csJzwsh41qj+v8IZ0imSeFc1Dx/fqvQGsws3v
	j6R7fXZ+CSP62Uf0XbgqIWfcDd9gCXNS60JLYBddobgwqfia7SlHGNJKPWzXIYbiEYhnYm1boNh
	pTh1rh9nbkr24TvHET47Hrpoz7W/qDwOp0RboNNTM6jef2sBidz4sN5h7qS29QR/wBeTeX3MSH1
	uKLzaiZWSQIM5ReeoX3EqKawEUzKN9JxOf5qOsmtJ
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr8947853eec.0.1794798235185;
        Sun, 15 Nov 2026 19:03:55 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:54 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
Date: Mon, 16 Nov 2026 12:03:34 +0900
Message-ID: <20261116030338.422671-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

The conversion of legacy events to UMP MIDI 1.0 uses
note_ev_to_ump_midi1() for KEYPRESS events as well as for note events.
The function turns any event with zero velocity into a Note Off. So a
Polyphonic Key Pressure of 0 reaches a UMP MIDI 1.0 client as a Note Off
and ends the note.

Only a Note On with zero velocity means Note Off. To fix this, check the
status, too.
The conversion to MIDI 2.0 already sends a zero key pressure as it is.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 62bdef6dca58..c248d87f7a83 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -630,7 +630,7 @@ static int note_ev_to_ump_midi1(const struct snd_seq_event *event,
 				union snd_ump_midi1_msg *data,
 				unsigned char status)
 {
-	if (!event->data.note.velocity)
+	if (status == UMP_MSG_STATUS_NOTE_ON && !event->data.note.velocity)
 		status = UMP_MSG_STATUS_NOTE_OFF;
 	data->note.status = status;
 	data->note.channel = event->data.note.channel & 0x0f;
-- 
2.43.0

