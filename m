Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9EB2931D2
	for <linux-kselftest@vger.kernel.org>; Wed,  5 Aug 2026 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785899382; cv=none; b=hRPk+yr2nucoefDd3yprDL3gZBMiJBEmf2qDMUCl5JcRdZ30BL4b4n+hnrihTpE/y/WMFZdMYYWO+si3ux9Vrc+xe7IFpfVnImkTGxLH7gFyVTFueMd2yJ5ORVMsNlKnMS4WnjUEbxGFh+dDJNz4tAFhyt0ZiCe+oFjyBd9bRzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785899382; c=relaxed/simple;
	bh=iGXs2uanhkkiJv05ETWhxr8G928ZtOPpqHDma635RMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QaDvQCwa2BXk/NlthjBV7xOGTGRGNDBiGydeon9gnOEOv2+4tINfCBvkSfq2Ngnj1O0OheIhCriGOkmJNuVB9z3/J+jxlQ7NqEsBmUA+HQkA/DafTdLFQWUIFy5KjIe5v2oZRxI28gMipmNoRRwmGdtUOmQ+H6Ag7hK8/rdj+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXfUAw8Z; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXfUAw8Z"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-459281bc13bso288356fac.2
        for <linux-kselftest@vger.kernel.org>; Tue, 04 Aug 2026 20:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785899379; x=1786504179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbCSMNnXEGywcpTsseAw/dfnWMJEOnf7wjvObv6gVFI=;
        b=AXfUAw8ZCve5lRrmclUFjB7f5AdlL/lsDCQxaat664l/VzlgX1P7oKkDtfD/Mazybb
         6/hqJRjooIz6EZzYG9xqk7liqz69gK+Npcb5NzYmCRzDaTGceO8DX4pQoa1BwX7uEe0X
         EayAcHCQpPk5LgHohtf2AahllTBByi8k/LmGLoT4EWlUR8FIaFBft2/GqQx+O9OP7VAr
         bwElqcZLXA/BnedJM229blYUf3Ve7qLTpYA9NAc7NxmjFEuJ/brA3Nu/192yddGy/pUp
         tSa8HLvvUpyzvTKlFeuwtzT/EcDfTAHJtqGCbAYEGzkjhZO3tbKm4nGz82jDD7kTGsaj
         SHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785899379; x=1786504179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbCSMNnXEGywcpTsseAw/dfnWMJEOnf7wjvObv6gVFI=;
        b=X/3Ywa9JEe8+E/UlkrblzyThgOydcLOKBL9lwrj/ZKpb+OOyn62JEKOqYjOA0tvV29
         K3YEZQ7ERQDQZsqsG9CyCzbESC83HGUcv4FsSd/l0W0M6lodom9+Lynbobs/PPHr0UVT
         Ky36fvJ/QZYWmDKgAhEYb8FTzXXvk3qvZaG/9Aoi1BAwtUSBESvpF6lSqW2y3qaDyYNO
         cozscHCTZxnwYiroe6ThHoU0UnugwU5VNNxV35VqJAyAtIgC+LHNMAo3ZZhvaSPDMEL2
         56AOQiTe59f1HJhDAenAm2+g9vwTrtGK8VraYpcLJdcCyHpKBNziFqpDpQwz7mBZCch+
         ks5A==
X-Forwarded-Encrypted: i=1; AHgh+Rp3rmKS0PwTYhSPiOKpZbMY/dKaKwnNJRhJaM//qBmWhSykq5UDV+RApWRgabPTuRBCvNYhM3fgewK1a0a+hJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39RxiahdSR8ZJnMljIE4ZRZxG1sPVICICalCmpIbFeH2vTxf1
	/edMTLVwPzI/m7/hv7W6rwq67aWR4ootY+RjN7obaQbs9VnXVFxWl0MMVXGF3JnD
X-Gm-Gg: AR+sD10DS33AjMZwKpqP6p4qyJi3u3wR/+YIM7+PgmgJ6tOM5rtOSeQn6b4mIhDM5I2
	VYa4avH42dayaCF8cdl9tnDiwgcTMa4E4JXlrg8fR2bXtCUQUYSXgQC5t9bVK31i/kZMJFkE8g6
	IZ+Fss69hyV0ceur0QxwoyVaNRR20iDqbFrNvqwdwAbpsEFU+1phWnwwLFdEKN2xAruC9Ptfr6i
	jWUzp1XWlTvp2nwoylR4pJxtL1NCL0r1s7vL6Vas8yn0K2KXYtxp6WZ6RILcRzSP3EyjtR8Oiao
	N/RcFb2onHahvqt5UUBtUuAarlwF0nD6I19dcSkoE9F30NvGxEiqUoF4iASLX3GU5xoqJe/qKy3
	Ku37QibZ2yzQ8l+gaxEk4hedAscBo9sMVMiZ95loUe2PpVHEIhItuCtm8Pj+EuAOFFbMQu3xXPW
	a+nFuXm857k7acsWW/yQDKHskgGZq+xYtH+kisxP+frYKYbz9iXwPqZLaQTw==
X-Received: by 2002:a05:6870:247:b0:43d:d0c:ac30 with SMTP id 586e51a60fabf-4599e55f1f8mr2158662fac.0.1785899379215;
        Tue, 04 Aug 2026 20:09:39 -0700 (PDT)
Received: from localhost ([2a03:2880:31ff:56::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599e24dfa6sm1352663fac.6.2026.08.04.20.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:09:38 -0700 (PDT)
From: Mohsin Bashir <mohsin.bashr@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	alexander.duyck@gmail.com
Subject: [PATCH net-next 00/14] selftests: net: shaper: Expand shaper API coverage 
Date: Tue,  4 Aug 2026 20:09:22 -0700
Message-ID: <20260805030936.1092907-1-mohsin.bashr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohsin Bashir <hmohsin@meta.com>

Add more net shaper selftest coverage for group operations and nested
node management.

The series first prepares shared cleanup and capability helpers, and
separates the basic netdev grouping coverage from the rate-limited
variant. It then adds tests for updating node shaper rates through both
.set and .group, discovering the supported nesting depth, deleting child
nodes and reparenting their leaves, moving queues between nodes, and
rejecting node reparenting.

Further patches broaden API coverage: exercising the full set of scalar
shaper attributes, rejecting invalid .set requests while leaving the
existing configuration intact, grouping leaves drawn from different
parents (which requires an explicit parent), and recursively cleaning up
nodes left empty.

The new tests use the capability helper to skip unsupported devices
instead of depending on earlier test ordering, size their queue
requirements from the number of TX queues exposed in sysfs, and register
cleanup for created shapers as soon as the operation succeeds.

TAP version 13
1..22
ok 1 shaper.get_shapers
ok 2 shaper.get_caps
ok 3 shaper.set_qshapers
ok 4 shaper.del_qshapers
ok 5 shaper.set_nshapers
ok 6 shaper.del_nshapers
ok 7 shaper.set_all_supported_attrs
ok 8 shaper.invalid_set_preserves_state
ok 9 shaper.mixed_parent_group_requires_parent
ok 10 shaper.recursive_empty_node_cleanup
ok 11 shaper.basic_groups
ok 12 shaper.basic_groups_with_rate
ok 13 shaper.qgroups
ok 14 shaper.set_node_shaper
ok 15 shaper.group_update_rate
ok 16 shaper.delegation
# max nesting depth tested: 3
ok 17 shaper.nested_depth_limit
ok 18 shaper.delete_child_reparent
ok 19 shaper.move_queue_between_nodes
ok 20 shaper.reject_reparenting
ok 21 shaper.dup_leaves
ok 22 shaper.queue_update

Mohsin Bashir (14):
  selftests: net: shaper: Drop redundant command timeouts
  selftests: net: shaper: Prepare helpers for group tests
  selftests: net: shaper: Decouple basic_groups from netdev rate
    limiting
  selftests: net: shaper: Add basic_groups_with_rate test
  selftests: net: shaper: Add node scope .set rate update test
  selftests: net: shaper: Add .group rate update test
  selftests: net: shaper: Add nested depth limit discovery test
  selftests: net: shaper: Add child node deletion reparent test
  selftests: net: shaper: Add queue migration between nodes test
  selftests: net: shaper: Add reparenting rejection test
  selftests: net: shaper: Cover scalar attributes
  selftests: net: shaper: Reject invalid set requests
  selftests: net: shaper: Cover mixed-parent grouping
  selftests: net: shaper: Cover recursive node cleanup

 tools/testing/selftests/drivers/net/shaper.py | 1065 +++++++++++++++--
 1 file changed, 978 insertions(+), 87 deletions(-)

-- 
2.53.0-Meta

