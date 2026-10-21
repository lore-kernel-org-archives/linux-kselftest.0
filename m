Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792568807;
	b=rRD9Rk6+MvJP4qywnbQwwmm6CieGQ/3N7Ja0VI5UQi0F8VB+68gEEwZBAeEaJpdGGa9l
	 doPQtdS9E+m0ZKKWzUT9zp6ti2Oq4ZG+GJq0KhQZPnuzWJWUTno0Z0iiTufy95yUtqYPv
	 0pgq8hjB8Se2GvyLZUYjwlCZ51bGezp0iYmFAotRKM8BMeyXZlzBlhjbGIHcUul3wHcwD
	 gCy+foXHn81ujMn96lEBWRWlNz2BoLNkGvX3w2KTywUWzo/7PS9PXyZZxUtX6mAQUNuBS
	 m8HKz5g4RuJVBJZ8syfR8MuxxD39VLGBD8RfDeA8TOqOxInTMkxZDddfWlaqFjzoXDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568807;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4wOKV3uTe7ngC/bk4GM0xP88MMKFpUGtrZfXCCbot38=;
	b=TllsyXRLTvT4eTiZWDxuZSSiU9txyn98pAF0/JjAdkbhfFQY1g0qCe7OvYfSTHa3aGNt
	 1OCbNlGIMZmWyIv3UdK0g3Abn5++F5I5nysKBv0t2pEdZVs9OYWxp5/V8Ka3P9uHx0txf
	 9okwujer/vYCLZxBGPBqFZcW0sm9fmOgjgDHL7LtQajG0UKkFwkFuMRvrpzigX7Eg3E/Y
	 zxrrxrz0aBWrB39cfZ6ucFbvV8fmcNdRn1cFHFBdjAQT0unlMGhEg5ZL/6r+vVHbM+BBq
	 G/WmTeMX3Wx4zI7O3ufzaDXEE1xStMdUnoYAmu+UtrhjOWimsA0KZV/bQeEj/CnByGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCLpk7rW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACC606A319;
	Wed, 21 Oct 2026 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCLpk7rW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792568806;
	b=wr21dBf0da0tubCLnWdhV+HPXBDu0i7NNMlbjHzabi92gnBwQSLcemzAPGGKELodFW8H
	 JC2Mhj4BYEu904pWA5ceNvfYbhvMj9rBbgDXH+Nk41RWeMi7Jl4iYiN94w3V9BjDEL3/h
	 07d4NPdelc4ajYIluXQIna9IjULqq2tS8gdyILsm3lKK4ACQUZFd82FY/53qiyXhH2tD0
	 B/0z/18j+ZjvTmW2dSbz3amPWPiq279yIgAiEO+N2tLt0JhTCrm3SFJAMqTZbDDMUQ7s0
	 1reURfSdQ8bvaJZB03Rxo8g1iNwjvu8yy0iKfH6QET5QAX12IrQ7/QSYdYoAJn63lDA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792568806;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4wOKV3uTe7ngC/bk4GM0xP88MMKFpUGtrZfXCCbot38=;
	b=U3l3jsExu43NRME0Q6MxyacCwUNB7S58AT16930B9Pm1HiUIxYx40fLzEzw9ta01c9ag
	 uF5aKhIWtdZO0CTBN/xlBiNoDmVqUUSs+i2hnlVH6rnJIms33uUrcnTcStqa7D9N8oFYf
	 bb/kpGMkXMMXdSY3QagB1AHgHaKIQy6uXkC+5ILdE81SlgaY8VZDXyWgMaB9rpl9KNyvP
	 8TGO3ySgqykd/Sxr9PHTz9igd2/YKpezLkpmA9XEPDOOfuQ0oCLKpcsrvKHT7EWzX2TRx
	 qdIX69cCUrtGIfcybw6s/S8+eMYmeg2oaEPDaKU9bC5k0tJVVb7iOc1BX2ACEbGhnQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E78B61F000C9;
	Wed, 21 Oct 2026 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792568806;
	bh=4wOKV3uTe7ngC/bk4GM0xP88MMKFpUGtrZfXCCbot38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oCLpk7rWW7TpHQevsjxLQtVY8CxEPj+EerbTMKdbgkykM6IvxH6wVtBt7XNuZtuAc
	 ri7ET6t3Nss5rnkiyE2S2h+oNfN8qJ5Ml6WqQ28Gx7FxG86SzcVbBQALY+OKbjfTZa
	 uz8ur0/jXc8MTXChMuIqknYvleTuaYiBnGtE9N9B2N040tgPbzJ6Owgy9QJuL/3RT8
	 oRMjh9Foji0H2PhwL5IMla22o77qBbwU/f0LJYKPMv304ToNU77KWQyuEgBN2GrJeJ
	 g1DOFo4lP+Os8ZwflJ/gdgPGDRG7c1jtJr0QaCzcVlC4K8pF5WX1bfQypzjb/akK4j
	 8FRroVlq419Bw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5BBE043316;
	Wed, 21 Oct 2026 07:46:45 +0000 (UTC)
From: Henrik Enquist via B4 Relay <devnull+henrik.enquist.gmail.com@kernel.org>
Date: Wed, 21 Oct 2026 09:46:46 +0200
Subject: [PATCH 2/2] selftests/alsa: Check the aloop PCM Slave controls for
 a matching playback
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-aloop-slave-controls-v1-2-62297727177f@gmail.com>
References: <20261021-aloop-slave-controls-v1-0-62297727177f@gmail.com>
In-Reply-To: <20261021-aloop-slave-controls-v1-0-62297727177f@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Henrik Enquist <henrik.enquist@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792568804; l=2678;
 i=henrik.enquist@gmail.com; s=20261003; h=from:subject:message-id;
 bh=VSTLeRkvDN+ZF+CMMCj3hMx1dw85nE2aZG16Hn9p9sY=;
 b=4K+sccxtaLcCx3g/oIrpq0WvrzVqWT2n9N/fZgRhtxxFFt3xzzSD4MXm05dmLtnzT3DmtJpJQ
 y1idqp+KfGtBDCvZNBWaTTPywRrxhYCq5wW+kUXwFGpI/PEv4qMbf2M
X-Developer-Key: i=henrik.enquist@gmail.com; a=ed25519;
 pk=ctrSXwtuuiWIZbc1qNzu+n+1PkhB/a+2nlRyXd5j2pg=
X-Endpoint-Received: by B4 Relay for henrik.enquist@gmail.com/20261003 with
 auth_id=1105
X-Original-From: Henrik Enquist <henrik.enquist@gmail.com>
Reply-To: henrik.enquist@gmail.com
Content-Transfer-Encoding: 7bit

From: Henrik Enquist <henrik.enquist@gmail.com>

Add a test that starts a playback with the same parameters as a running
capture, and checks that the capture keeps running and that the
"PCM Slave" controls report the playback's parameters, with a value
event for each control that changed. Before the previous patch, the
controls keep the parameters of the earlier stream and the test fails.

Signed-off-by: Henrik Enquist <henrik.enquist@gmail.com>
---
 tools/testing/selftests/alsa/aloop-test.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tools/testing/selftests/alsa/aloop-test.c b/tools/testing/selftests/alsa/aloop-test.c
index a58b9fdbdc..74d6ccc127 100644
--- a/tools/testing/selftests/alsa/aloop-test.c
+++ b/tools/testing/selftests/alsa/aloop-test.c
@@ -323,6 +323,46 @@ TEST_F(aloop, params_change_stops_capture_with_notify) {
 	snd_pcm_close(capt);
 }
 
+/*
+ * A playback that joins a running capture with the same parameters doesn't
+ * stop it, and the "PCM Slave" controls still report the playback's
+ * parameters rather than those of an earlier stream.
+ */
+TEST_F(aloop, matching_playback_updates_controls) {
+	snd_pcm_t *capt, *play;
+	unsigned int events;
+
+	/* Leave the controls at other parameters than the ones used below. */
+	ASSERT_EQ(open_pcm(&play, self->play_name, SND_PCM_STREAM_PLAYBACK, &playback_params), 0);
+	ASSERT_EQ(start_playback(play, &playback_params), 0);
+	snd_pcm_close(play);
+
+	ASSERT_EQ(set_notify(self->ctl, false), 0);
+	ASSERT_EQ(open_pcm(&capt, self->capt_name, SND_PCM_STREAM_CAPTURE, &capture_params), 0);
+	ASSERT_EQ(snd_pcm_start(capt), 0);
+	read_events(self->ctl);
+
+	ASSERT_EQ(open_pcm(&play, self->play_name, SND_PCM_STREAM_PLAYBACK, &capture_params), 0);
+	ASSERT_EQ(start_playback(play, &capture_params), 0);
+
+	EXPECT_EQ(snd_pcm_state(capt), SND_PCM_STATE_RUNNING);
+
+	EXPECT_EQ(cable_ctl_get(self->ctl, "PCM Slave Active"), 1);
+	EXPECT_EQ(cable_ctl_get(self->ctl, "PCM Slave Format"), capture_params.format);
+	EXPECT_EQ(cable_ctl_get(self->ctl, "PCM Slave Rate"), capture_params.rate);
+	EXPECT_EQ(cable_ctl_get(self->ctl, "PCM Slave Channels"), capture_params.channels);
+	EXPECT_EQ(cable_ctl_get(self->ctl, "PCM Slave Access Mode"), 0);
+
+	events = read_events(self->ctl);
+	EXPECT_TRUE(events & EV_FORMAT);
+	EXPECT_TRUE(events & EV_RATE);
+	EXPECT_TRUE(events & EV_CHANNELS);
+	EXPECT_TRUE(events & EV_ACCESS);
+
+	snd_pcm_close(play);
+	snd_pcm_close(capt);
+}
+
 /* With notify, a capture opened second is still pinned to the playback's parameters. */
 TEST_F(aloop, capture_constrained_with_notify) {
 	struct probe_result res;

-- 
2.53.0


