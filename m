Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F44D4C753A
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791470766; cv=none; b=h00WXLhYWiDuBNcXGOzq72YCcEcd/zGbBzXaPGc3aYmOYrxni4DxolYGLAmAEaUQKyyvJuQksg72uCFyjFS7QTnf7WiZbKomPU+OA+Ymj9JTh2wdNTPOXTzJ06klv6QIANkcaqlly/7PxZREYF/gFFeJfUAi8gEPbR0ufVnltWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791470766; c=relaxed/simple;
	bh=MLOJVwWzQhd0d/DLT4Tfa5XEt/KHRPHFFa0NUDNSgO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GoFbYAbHKJUxLU6VbZ3OzSjZmxB9JI4istd6F/1+PJckB1X0JYWAhuxr3QHRSWsfRmoNIvwU2+WH0MgRCZ1meTj+Ju+j/2spw2dVAgIy37nnX7+V1Hslpa22EwG9dpfDnQNxIykp2isj7eVKA1kgH2mfPIVYAJiD68143E092V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmsAG0fD; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmsAG0fD"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35154cb9de2so4462625eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791470754; x=1792075554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/o2LgKVqbpmnkP4q3l7vgAMjWCFk5nWYZQGCoCxnxtE=;
        b=dmsAG0fDkR35OVLVnhsRwXKECQTh9i98gwAjyqXq9tM/F4x2UcKF1671P0g4jpXS2N
         +wqmgtdcDZKSZ2NdJOe2LTSknMCrJonv4hGXg2mx2xwMjTiMQg/lDzatZzwp2OG+sqAW
         q/QyvqJo6lXEjijEXJ2PcjOBSUTD/qfVfycs1JpKux4W/pvpXTPGBiQ9szZkTecZ8H6b
         6YneUfFehGyVPnGhHHewzFsNT4MvyeJauyKHsUOYrT6mRVQhrar/rMjQbj1r1nZtlsJU
         cribDhsFCuA1xoCJbdbqT/UvxR+6kCU55p/WpqeLxBvz9BRiHKFkFS67IgdgOvIaA0cb
         81yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791470754; x=1792075554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/o2LgKVqbpmnkP4q3l7vgAMjWCFk5nWYZQGCoCxnxtE=;
        b=rb7vwZro/ePb54AkZjVXIsOC6IJeADd2Cx0tbPWv/sRepPGwRHzWILTW/wMsH5sJo7
         nfya54ibijHC84hnQFOuwXS4ZcKl2HpvobjQq1Z7eQEb4yWyn73jN8aQ1TN2hIOMQVCh
         DnhOoRSOfjRvH3i0Vf8naANBNdQCTJs4uK2hcm4OjOk+jygjHJYHEW2/PIDxICyoA112
         H3Cd1vS0s5n0kIf8I2TFyB++CkTEipsPUaD5zUfMaOuAEG0/5iaTSyonlsmdsfCwDAS5
         xkRg+a5zPAGNGYKKLqmJp9OjftVWuBnMPeu7jxQ1EFeY7yQxHlCaCNYgINNUz2vG7FNi
         ULuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQDtQMGWgDDPpt403hlbtFfBVdSCWiWd5EBGVgb/tUaNGBU1gZIJunRW9nUkCyTJyxmmZf8yRqxG/syadaydg=@vger.kernel.org
X-Gm-Message-State: AFuF++mCg6lDTf33lH862Vp3jJ9w812zrzI3pjWGjMNNMzwHMaxCn6o9
	/whyQxdqOD29sokUigDWMXJcTa/cWZxPiASGS5/B8AqKXbhbN8UwFPUaVD6Wm2ns8/D4DA==
X-Gm-Gg: AYBFou0UDGLUaBMymU6DuNKqgvV40+nHqcKV9+rnGqH4/eZoAqg/9c+bzv6++xWZ7y3
	pu8EPSTnfSNkH5T/edrkpWjakmhkTnt4mktrOwDrjCqEVYONVGq2Emcj0dhsvfr1+8R5b1LTW9n
	DzbHcAYz5OQq4P63NzErROOFtH1fR35tZ1z6SrbGIwmvQN6Rg87uH7O9DsEyzSJCyU/Dn0bBDkd
	tG7wWqno8nUddJY0rb8WYCk+KvLP/Ilqo88h7fXEOBiB6xIIES6MHL2EcroBunK6Ym/Jphz27NE
	f8fGoA+n+jBA9Ker2Uh/cwdtcQ3h/tRI2LPT1dnrLXnlUj0Mx10FT16kbuWBDjaIoaibsXC6pFJ
	0dkU/125iC0YHryL49ZEBippHbWgICl3ei/KycNHgvOfwQ6pvIa9gm0W1YwynF92wtGExDq4Whw
	jkEWfhauVinQzVujxW5n44w5OtI7IOwsftLcr5gZUdgfAJ+cpREQ+8ADM/jDKFBP3QbvUqOh6aV
	d6I
X-Received: by 2002:a05:693c:6518:b0:33c:e72:5b3b with SMTP id 5a478bee46e88-3515de5e146mr7540017eec.25.1791470754147;
        Thu, 08 Oct 2026 07:45:54 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aff5dd6sm17913731eec.26.2026.10.08.07.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:45:53 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:45:40 +0800
Subject: [PATCH 2/2] selftests: ublk: make the fault_inject delay a pure
 timeout
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-bug-ublk-selftest-fault-inject-delay-v1-2-a96af7ead06e@gmail.com>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Uday Shankar <ushankar@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ublk_fault_inject_queue_io() queues the delay of each I/O as an
IORING_OP_TIMEOUT with a completion count of 1. Such a timeout also
completes as soon as any other CQE is posted on the ring.

With more than one I/O in flight, the completion of one I/O ends the
delay of the others, and ublk_fault_inject_tgt_io_done() reports every
early completion as "unexpected cqe res 0".

Pass a count of 0 so that only the expiry of the timer completes the
timeout.

fio 4k random reads for 10 s at queue depth 4 on a fault_inject device
with --delay_us 1000000:

                            before      after   expected
  I/Os                     2263170         40         40
  mean latency             16.3 us    1.000 s        1 s
  "unexpected cqe res 0"   2263169          0          0

Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/ublk/fault_inject.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/fault_inject.c b/tools/testing/selftests/ublk/fault_inject.c
index e055f51a65447..4b59f17a918c0 100644
--- a/tools/testing/selftests/ublk/fault_inject.c
+++ b/tools/testing/selftests/ublk/fault_inject.c
@@ -92,7 +92,7 @@ static int ublk_fault_inject_queue_io(struct ublk_thread *t,
 	 * reads it only when the SQE is submitted.
 	 */
 	ublk_io_alloc_sqes(t, &sqe, 1);
-	io_uring_prep_timeout(sqe, &opts->delay, 1, 0);
+	io_uring_prep_timeout(sqe, &opts->delay, 0, 0);
 	sqe->user_data = build_user_data(tag, ublksrv_get_op(iod), 0, q->q_id, 1);
 
 	ublk_queued_tgt_io(t, q, tag, 1);

-- 
2.43.0

