Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C264418EC
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033547; cv=none; b=KQGhtshcatOMS0XXpn4Hgs44GuLlW4HyGHSNKQpI0Xyw/OP+ZF0LI1QKRTb1iDK1L+b+49ZZJJpO5OhPXM+pscb11uygYd9WBFXlUphq2wBS9wZ3v/16DJQ82YvGh4BIvZ64tm7H8b9nOBoO6/UN6je5+CpfL4w/4lo5vZNVlzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033547; c=relaxed/simple;
	bh=JAQQN7P77tr97fU7vyuVMrvCiNP4sSFAq43cZhTlmi0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZwGhSpA0hQPP1Awaw1iIQzasoefZpAe8hDhVbHzAsNXmYOgtYj03PYTDUe08FEtMMPvqGjUks0r0ldds4tUrOIrgE46n70FD0NYepGB104gVgTnR/yx84zbvCg9EEsNHKqPNttH/eBbnPBHmECYoYs2NJ/Tdlz4+I2Kytq6jEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHjsEK28; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHjsEK28"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64942ebf1a3so422492d50.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033530; x=1769638330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mpdsMRuLW1cRrssyJH9GNY+tfbuaJ3H6voxC/Fdtqg=;
        b=EHjsEK28MO6BZ3JsqhVJmLDyEWLSWbkF9pNAa34jS5BeY9tLpZcpMEeX279xsvLjhw
         e7e527ca9P3bStmp5w40AHBT5GTOyRY8eyHMQWDXr/GrKiqcnzI0/CtT7tf9PCIQW586
         3XNnihqOCXsd+Z3PMFWnvh76nMQfVEm1tDdZdOIwCmJB9MCDfGXEpqYkAkp3edZbjArs
         jBRej2Ac5y6gIheucYSdMpBIFToHvgAQkCfTZUeh4QaWCKG9nPKyyMFxbAgpnCEbfmXD
         z7E1c8FIQEf2Hn1FyRU0ALXCaesSwSQ9Bakjm75EWXV9gA5hpjd1BB84YozeV5uc1oel
         RBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033530; x=1769638330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2mpdsMRuLW1cRrssyJH9GNY+tfbuaJ3H6voxC/Fdtqg=;
        b=gyky3EMkfNsJB7/1zn80BuOJg15SUNnK8nUUoPw/UX3wO87htcovNNwssnzqQxDo0K
         cxzhoqa+KwxSticwI7F/u99yRc/7kNipKDx471tOJuEGlKm88T9vav5tJKnxlanpEvO9
         Gar6rTE8zHyTTPUoI3uJYl3pDhjtQlRxJcbcFrWf4bsAMntDsfwxv4vFplzZ3ENdgYOL
         qXGSozLIFY3AREpFjwNZzWd4aDI1fnhXu6Iqx1Tu8gd2aK+uSvfiYjO70JwbrMUeGEDg
         PNuyTtAreAYR3JVWZ4WN4a7UAngF6cDqNj1sPBxpM6038RkrFNDhV2YeTi8naZJQU8Kb
         IXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo1+odAhFHofw8G2EIiXnpsfUaUQA+v2RReUivMZTuGE+UHbp7Fl3isTyQBWjzj4Ne99MpFsOAfCUWmX8DjuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwT+I1di41bkf8e9Hvo65XZF1x/cIVVsayzlRGn2tm3JFeXcYo
	Q1d1AGgn3aIB+v+BWk/PrS+tMrnIusohbIOx/qDWcHh0Bql14junuwxk
X-Gm-Gg: AZuq6aLHdBYuZbc7Ofx+MLviLpfNkfY0Dt5ygGyQ+9T16xcEGUHA5pSG/m/S97Utkqi
	Djw20HsHJVTn/jpHuyyBTUcujjiEstC6ODxumIQPgcYOIH2Orj+uJteXQjkkUAdOX7/XBIitFcV
	xaXRVQFb8b4TD2typ3teB0wCdMxDdJGzuPBRAd5fP6kcBeiu+8k0bGRHkPKxOQobaFQlZyhwi2z
	YW/eg3lyHMdLbyD4hn5wMeRUZjM/cLHFYs5s2wRjAyrVl7GkBwMGGPxAdfgtaCU8w9mvysGr4wG
	LgL/KGCpsYlagmRg1v86S2uEUOsLQL2/N2utJV7aHVkZNzcLs47SH6sZvOcGgy4fG3SdbqpJXit
	8zvmtSgN9m0EmGHDnHyyH0EolclhB5XJ+tgRyZOOjNET9rHIMggQ/gzSUv9B/cEVYJ5s5DVAIiW
	vI2/z5GjuA
X-Received: by 2002:a53:d013:0:b0:644:472d:db04 with SMTP id 956f58d0204a3-6493c84922emr5253487d50.55.1769033529707;
        Wed, 21 Jan 2026 14:12:09 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:2::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6494080138fsm2463523d50.20.2026.01.21.14.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:09 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:52 -0800
Subject: [PATCH net-next v16 12/12] selftests/vsock: add tests for
 namespace deletion
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-12-2859a7512097@meta.com>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
In-Reply-To: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, berrange@redhat.com, 
 Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Add tests that validate vsock sockets are resilient to deleting
namespaces. The vsock sockets should still function normally.

The function check_ns_delete_doesnt_break_connection() is added to
re-use the step-by-step logic of 1) setup connections, 2) delete ns,
3) check that the connections are still ok.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v13:
- remove tests that change the mode after socket creation (this is not
  supported behavior now and the immutability property is tested in other
  tests)
- remove "change_mode" behavior of
  check_ns_changes_dont_break_connection() and rename to
  check_ns_delete_doesnt_break_connection() because we only need to test
  namespace deletion (other tests confirm that the mode cannot change)

Changes in v11:
- remove pipefile (Stefano)

Changes in v9:
- more consistent shell style
- clarify -u usage comment for pipefile
---
 tools/testing/selftests/vsock/vmtest.sh | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
index a9eaf37bc31b..dc8dbe74a6d0 100755
--- a/tools/testing/selftests/vsock/vmtest.sh
+++ b/tools/testing/selftests/vsock/vmtest.sh
@@ -68,6 +68,9 @@ readonly TEST_NAMES=(
 	ns_same_local_loopback_ok
 	ns_same_local_host_connect_to_local_vm_ok
 	ns_same_local_vm_connect_to_local_host_ok
+	ns_delete_vm_ok
+	ns_delete_host_ok
+	ns_delete_both_ok
 )
 readonly TEST_DESCS=(
 	# vm_server_host_client
@@ -135,6 +138,15 @@ readonly TEST_DESCS=(
 
 	# ns_same_local_vm_connect_to_local_host_ok
 	"Run vsock_test client in VM in a local ns with server in same ns."
+
+	# ns_delete_vm_ok
+	"Check that deleting the VM's namespace does not break the socket connection"
+
+	# ns_delete_host_ok
+	"Check that deleting the host's namespace does not break the socket connection"
+
+	# ns_delete_both_ok
+	"Check that deleting the VM and host's namespaces does not break the socket connection"
 )
 
 readonly USE_SHARED_VM=(
@@ -1287,6 +1299,78 @@ test_vm_loopback() {
 	return "${KSFT_PASS}"
 }
 
+check_ns_delete_doesnt_break_connection() {
+	local pipefile pidfile outfile
+	local ns0="global0"
+	local ns1="global1"
+	local port=12345
+	local pids=()
+	local rc=0
+
+	init_namespaces
+
+	pidfile="$(create_pidfile)"
+	if ! vm_start "${pidfile}" "${ns0}"; then
+		return "${KSFT_FAIL}"
+	fi
+	vm_wait_for_ssh "${ns0}"
+
+	outfile=$(mktemp)
+	vm_ssh "${ns0}" -- \
+		socat VSOCK-LISTEN:"${port}",fork STDOUT > "${outfile}" 2>/dev/null &
+	pids+=($!)
+	vm_wait_for_listener "${ns0}" "${port}" "vsock"
+
+	# We use a pipe here so that we can echo into the pipe instead of using
+	# socat and a unix socket file. We just need a name for the pipe (not a
+	# regular file) so use -u.
+	pipefile=$(mktemp -u /tmp/vmtest_pipe_XXXX)
+	ip netns exec "${ns1}" \
+		socat PIPE:"${pipefile}" VSOCK-CONNECT:"${VSOCK_CID}":"${port}" &
+	pids+=($!)
+
+	timeout "${WAIT_PERIOD}" \
+		bash -c 'while [[ ! -e '"${pipefile}"' ]]; do sleep 1; done; exit 0'
+
+	if [[ "$1" == "vm" ]]; then
+		ip netns del "${ns0}"
+	elif [[ "$1" == "host" ]]; then
+		ip netns del "${ns1}"
+	elif [[ "$1" == "both" ]]; then
+		ip netns del "${ns0}"
+		ip netns del "${ns1}"
+	fi
+
+	echo "TEST" > "${pipefile}"
+
+	timeout "${WAIT_PERIOD}" \
+		bash -c 'while [[ ! -s '"${outfile}"' ]]; do sleep 1; done; exit 0'
+
+	if grep -q "TEST" "${outfile}"; then
+		rc="${KSFT_PASS}"
+	else
+		rc="${KSFT_FAIL}"
+	fi
+
+	terminate_pidfiles "${pidfile}"
+	terminate_pids "${pids[@]}"
+	rm -f "${outfile}" "${pipefile}"
+
+	return "${rc}"
+}
+
+test_ns_delete_vm_ok() {
+	check_ns_delete_doesnt_break_connection "vm"
+}
+
+test_ns_delete_host_ok() {
+	check_ns_delete_doesnt_break_connection "host"
+}
+
+test_ns_delete_both_ok() {
+	check_ns_delete_doesnt_break_connection "both"
+}
+
 shared_vm_test() {
 	local tname
 

-- 
2.47.3

