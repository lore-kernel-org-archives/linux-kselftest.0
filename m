Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801427;
	b=LbwOAHoMkAekKB5AxyUOuacfCIhTbdbMSz04JpqsqglSiJLkPGx2XqFzma+sWd14EhZT
	 ayEr1XlizJTXqXW3C2DCWGwYDv0j7iOYerzJOjbEFyDzFm4V0Plb05oJG/dNlZjksvNg3
	 oINAw/oV9POdAVK2lQgUmFOaR69fvJv0MqZ/fB2RyQQ5Idlt8fE6RyDR7lZG+Wrr3jueM
	 eV1iAeAf8zWh9HURiext/3XF8IS+bm8VwpAQVM1bPDHgLGGYXQIVD3tdcEKYbprsEiOGG
	 aUgmXmQqbRNyFOG/74QEGQ1TNXOgXPNvT2v7msaHLRgB5gib8jQPuhfO3xXo7DfMOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YyohTnmk/DJgPX9gXpaeJHQxtUXrnRbDmT7Y6blnwak=;
	b=Pnz6YqY+CnYO8p+IWWoYw1983gJg0tBxsITDNdXQau32uUvOJCXsOaibw26NrBqincGg
	 Ra0K0K66aNri+f2ZgPnH2XF2HgcOsKzjQ3eaEjaZ8zN9vdc3ryKYVJzpOkQkma9JOm/9y
	 a46gJxxve0HJeIK181ia5tvtGtgvlSNtrLPayeEz3nOMe54yVtxYPnyiS7afZcFIlIWgh
	 gM7YU5RaE5TDTrSFP9GOaiyE9eaT6ALLY5rnfzw1JpCZtJT3fl+qrsa2nBV0M7vwVdo/n
	 Nj8PPE4tmoY+3XF3ohq5+DC465MbM1WMY0LGaayEXSiZ9QhSgrSuliP8CxoW0+qUW2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/GhBJTs";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A99606A31F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 17:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2A99606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/GhBJTs
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38692f62b22so11404843eec.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801426; x=1796406226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyohTnmk/DJgPX9gXpaeJHQxtUXrnRbDmT7Y6blnwak=;
        b=w/GhBJTsoeU6LtTKiwMCAFTeQohpYXRadFJuPezxERvnHvAY0sUWFfujhA0S8en+IV
         +ho/rLv1nnPlztz8AN0OgoXvxuP/gbZG0kraxj0fn6dtrDAAyGkOYlVGL6AVpSyV2qBh
         eb7ntYQUonv8x4plD8xyQJOER9mDhbYAkz+m77Es5VLWNe7ilYkoM2S20QaiRsI7OVKK
         Ed/dR29W1H/uEVV8p5fsCy9sJfjLlYexWqbelKhPjZQzO++q2bdAKwSkoMkbAMx+1Gaj
         /6TDcFCI7OCNnK5Ty0anWd43ICz7zEg5rcOCWboas9yb7FlXA97wjgQtVP3PW+9PvKd6
         2l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801426; x=1796406226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YyohTnmk/DJgPX9gXpaeJHQxtUXrnRbDmT7Y6blnwak=;
        b=FcqU4Bjl5U6Z8mv4J07kpSGs4Hu47+392dCmiDKHFyf8ihYoX3ayDwzosuNeaCr/DX
         C+JIXaeFt9KbtI4PPWwPgYmCDXY0bAm6SQwWof1cCAx84GSeu/+NFtL5lYJceOGiIhHJ
         zSO9YuPxfoq7j37R+201eUiOCtupS9WzVBW8c5BdsYJyEym7EHE7Mvj2JrYUEa792WHS
         0/pn53zzBDwwUj4bYllHZCpsKY35Jzl89zK0d8kjuR1HBANSpk84/rExVH4KpDnDEfz0
         N5+JVpCSY8pnHtWdlW3uRzbMebBq1sZfMoy7q2uY8HFiqOamQG3pD7adqBa+zYRah/g8
         goMg==
X-Forwarded-Encrypted: i=1; AL+hErEB4sN9OcT6aM+nctUvlApdRf+kJvBycQGrU587mMh1skYIIh3U6YAhF4CsFvxktfjO8YbPew20Yq9t8/RX7Tk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7tUy2fb7deIGC25TcdQXip3y/TFr3Bvw6vzy0z988XQOtumyu
	107yJm6KmYzuHa+2YL7/S6E+RqOJgM1A+gNWvIhR7xEFqJAxYGOmdcdadM2/zeHPEaw=
X-Gm-Gg: AZFdTZcdBVBJuAoSM1+X1NUPYqgce//sbXcyWXtt8EkkzlxYNlJylp9NWcaGb5OMeDc
	UvxykgYzveJMkV/TyttlM+cXbNolMehHKDMxfLwD/STY0Dqakm9OSlHIRzbL37dZGAY1Ea7eyWQ
	mL+hqCHuAjXkEGzblfGy2rGwbqyI8VG/ATGE5ebke7C+y57m9Izzb5sJdbI4aTq4iz1RmAXAOAK
	h71xXPGIJIjUAYJ+Kw/a/k2EJFrV4MZ8StKV6jzwzamK2U5L7U3bjgxpdX6bioNQqbo8MXr4g/G
	VYADGGGNpK5IxLwKy5bdIiXrulKdx3OytWZE+Ue9wrH3Ekg/N0E8czpRL+b6XPL2wdkZZufh2pv
	SiHJ2dv9H13lNVGOMCE/eL6Y397rk069dT2CVIJ6zJ2d5x9ESL20P9M0AoBtiYMKSATYR9WhJ2Z
	eVEWDKLU0noYetHFckwS6FuV4LaSBJhz4k3QjE3+s/tyShe7pGF3VdFzf42E1eP454MdgJIMDBh
	pv4lcDsHeaXKsBgXuGqwVt7OEgNIV5/hTvu+jhoJBukw7tvCWfOgOigs446FrHjLAQe6BecdMT5
	u8m2htxALWKkUcdGRtaGvOGakO0QCn/QjdP47GmVisvRnvgnG2j+LJQNqAo=
X-Received: by 2002:a05:7300:ce11:b0:381:a037:b060 with SMTP id 5a478bee46e88-3856e63b3dfmr26095776eec.9.1795801425602;
        Fri, 27 Nov 2026 09:43:45 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm66064276eec.8.2026.11.27.09.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:43:45 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	willemb@google.com
Subject: [PATCH net v7 3/3] selftests/net/openvswitch: check that a failed set keeps the features
Date: Fri, 27 Nov 2026 12:43:15 -0500
Message-ID: <20261127173039.ovs-features-v7-4-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
References: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
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

Add a set-dp command to ovs-dpctl for the kernel's datapath SET command,
and two tests that use it.

The first test clears the features of a fresh datapath, sets the dispatch
bit with a valid pid list, and clears them again. It then sends a set that
would set that bit with an empty per-cpu-pids. The request has to fail
with EINVAL, and the datapath has to keep reporting the features it had,
which a kernel that records them before the change reads as 0x8 instead of
0x0. A second request sends OVS_DP_CMD_NEW for that name from an outdated
client, which makes the kernel drop the features, and a further set has
to work.

The second test covers the recirc bit. It sets that bit on a fresh datapath
and sends a set that would set the dispatch bit with an empty per-cpu-pids.
The rejected request has to leave the recirc bit in place. A kernel that
records the features first reads 0x8 there instead of 0x4. A datapath
holds that bit only when the tc skb extension is compiled in, so the test
prints the reason and skips when the kernel answers EOPNOTSUPP, and any
other failure of that request fails the test. CONFIG_NET_TC_SKB_EXT
depends on CONFIG_NET_CLS_ACT and both sit under CONFIG_NET_SCHED, so the
selftest config fragment selects all three.

The reference count itself is not visible from user space, so the steps
that use an outdated client only show that those paths run and that a
datapath keeps working across them.

set-dp sends the features it is given. When --features is left out it
sends the features the datapath reports, and it refuses to send the
request when the datapath reports none. A pid list that is not a list of
numbers is reported as such, and empty entries are dropped.

A failing run deletes debug.log, and ovs_sbx sends a command's stdout into
that same file, so the tests report a failure reason on stderr. stderr
still reaches the test runner from inside ovs_sbx, and unlike a duplicated
stdout it is not a second handle on the runner's pipe. The daemons the
suite starts outlive the script, and one that inherits such a handle keeps
the pipe open after the script exits, which leaves the run hanging until
the harness times out.

Every step that can fail says why it did. A datapath that cannot be read
is reported as that rather than as a feature mismatch: ovs-dpctl prints a
missing datapath and exits 0, and it leaves the features line out when the
kernel does not report them, so the check reads both cases from the output.
ovs_add_dp() registers the cleanup command before it returns, which used to
make it return the status of that registration rather than the status of
the add-dp it ran; it now keeps that status and returns it, so a datapath
that was never created is reported as such.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

v7: two fixes from review and CI.

ovs_add_dp() ran add-dp and then registered the cleanup command, so the
function returned the status of that registration. A datapath that was
never created therefore surfaced as "the datapath features could not be
cleared". It now keeps add-dp's status and returns it, and both tests say
when the datapath was not created. Sashiko.

The prints added here used percent formatting, which ruff counts as new
errors in this file. They use f-strings now.

 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 201 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  74 +++++++
 3 files changed, 278 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index 15685d242813..38fa1477b7cd 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -2,10 +2,13 @@ CONFIG_GENEVE=m
 CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
+CONFIG_NET_CLS_ACT=y
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_TC_SKB_EXT=y
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
 CONFIG_NF_CT_PROTO_SCTP=y
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..0006546f15b4 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -24,6 +24,8 @@ tests="
 	nat_connect_v4				ip4-nat-xon: Basic ipv4 tcp connection via NAT
 	nat_related_v4				ip4-nat-related: ICMP related matches work with SNAT
 	netlink_checks				ovsnl: validate netlink attrs and settings
+	dp_features				ovsdp: failed set keeps bits
+	dp_features_recirc			ovsdp: recirc bit survives
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
@@ -115,11 +117,15 @@ ovs_sbx() {
 }
 
 ovs_add_dp () {
+	local rc
+
 	info "Adding DP/Bridge IF: sbx:$1 dp:$2 {$3, $4, $5}"
 	sbxname="$1"
 	shift
 	ovs_sbx "$sbxname" python3 $ovs_base/ovs-dpctl.py add-dp $*
+	rc=$?
 	on_exit "ovs_sbx $sbxname python3 $ovs_base/ovs-dpctl.py del-dp $1;"
+	return $rc
 }
 
 ovs_add_if () {
@@ -1409,6 +1415,201 @@ test_netlink_checks () {
 	return 0
 }
 
+ovs_dp_features_set() {
+	python3 "$ovs_base"/ovs-dpctl.py set-dp "$@"
+}
+
+ovs_dp_features_check() {
+	local out
+
+	# A datapath that cannot be read and a datapath that reports other
+	# features are different faults, so they return different statuses.
+	# ovs-dpctl prints a missing datapath instead of failing, and it leaves
+	# the features line out when the kernel does not report them, so both
+	# have to be recognised in the output. It prints the value with %X, so
+	# convert before comparing.
+	out=$(python3 "$ovs_base"/ovs-dpctl.py show "$1") || {
+		printf '# could not run ovs-dpctl show %s\n' "$1" >&2
+		return 2
+	}
+	case $out in
+	*"No DP found"*)
+		printf '# the datapath %s does not exist\n' "$1" >&2
+		return 2
+		;;
+	*"features: 0x"*) ;;
+	*)
+		printf '# the datapath %s reports no features\n' "$1" >&2
+		return 2
+		;;
+	esac
+	printf '%s\n' "$out" |
+		grep -q "features: 0x$(printf '%X' "$2")\$"
+}
+
+# info() writes debug.log, and a failing run deletes that file, so a FAIL
+# would reach CI with no reason. ovs_sbx sends a command's stdout to that
+# file too, which is why this writes to stderr: it is the one stream that
+# still reaches the test runner from inside ovs_sbx. Do not duplicate stdout
+# for this. The suite spawns daemons that outlive the script, and a second
+# handle on the runner's pipe keeps it open after the script exits, which is
+# a run that never finishes.
+ovs_fail() {
+	printf '# %s\n' "$*" >&2
+	return 1
+}
+
+ovs_dp_features_expect() {
+	local rc
+
+	ovs_dp_features_check "$1" "$2"
+	rc=$?
+	if [ "$rc" -ne 0 ]; then
+		# The check already said why it could not answer; this adds the
+		# expectation that was not met.
+		ovs_fail "$3"
+		return 1
+	fi
+	return 0
+}
+
+# EOPNOTSUPP is not in the base errno list and its number differs by
+# architecture, so ask python instead of hard-coding one.
+ovs_errno() {
+	local n
+
+	n=$(python3 -c "import errno; print(errno.$1)" 2>/dev/null)
+	if [ -z "$n" ]; then
+		printf '# could not read errno.%s from python\n' "$1" >&2
+		return 1
+	fi
+	printf '%s\n' "$n"
+}
+
+# dp_features test
+# - a set with the dispatch bit and pids is accepted and reported back
+# - a set with an empty per-cpu-pids is rejected with EINVAL and leaves
+#   the features as they were
+# - an outdated new request drops the features, and sets work afterwards
+test_dp_features() {
+	local t="test_dp_features"
+	local dp="dpfeat0"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" ||
+	    { ovs_fail "the datapath was not created"; return 1; }
+
+	info "clear the datapath features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the datapath features could not be cleared"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "features were not cleared" || return 1
+
+	# 8 is OVS_DP_F_DISPATCH_UPCALL_PER_CPU, the bit that makes the
+	# kernel read per-cpu-pids.
+	info "a set with the dispatch bit and pids is accepted"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids 1,2 ||
+	    { ovs_fail "the set with dispatch and pids failed"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 8 \
+	    "the accepted set was not applied" || return 1
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the features could not be cleared"; return 1; }
+
+	# ovs-dpctl sends the empty list as an attribute with no payload,
+	# which is what the kernel rejects.
+	info "a set with an empty per-cpu-pids is rejected"
+	einval=$(ovs_errno EINVAL) || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	rc=$?
+	[ "$rc" -eq "$einval" ] || {
+		ovs_fail "the empty per-cpu-pids set failed with $rc"
+		return 1
+	}
+
+	info "the rejected set keeps the features it had"
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the rejected set changed the features" || return 1
+
+	# An outdated client that asks for an existing datapath again makes
+	# the kernel drop its features. The datapath keeps working.
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 ||
+	    { ovs_fail "the datapath rejected the dispatch bit"; return 1; }
+	ovs_sbx "$t" python3 "$ovs_base"/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
+		ovs_fail "the outdated add request did not run"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the outdated new request did not drop the features" || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 || {
+		ovs_fail "the datapath stopped accepting sets"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 8 \
+	    "the reset datapath took no features" || return 1
+
+	return 0
+}
+
+# dp_features_recirc test
+# - a datapath that holds the recirc bit keeps it across a rejected set
+# - an outdated new request drops the features
+# - the bit needs CONFIG_NET_TC_SKB_EXT, so the test skips without it
+test_dp_features_recirc() {
+	local t="test_dp_features_recirc"
+	local dp="dpfeat1"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" ||
+	    { ovs_fail "the datapath was not created"; return 1; }
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the datapath features could not be cleared"; return 1; }
+
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING. The kernel takes the bit only when
+	# the tc skb extension is compiled in.
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 4 &> /dev/null
+	rc=$?
+	if [ "$rc" -ne 0 ]; then
+		eopnotsupp=$(ovs_errno EOPNOTSUPP) || return 1
+		if [ "$rc" -eq "$eopnotsupp" ]; then
+			# info() only writes debug.log, which CI does not keep.
+			printf '# no tc skb extension, skipping recirc\n' >&2
+			ovs_exit_sig
+			return "$ksft_skip"
+		fi
+		ovs_fail "the recirc set failed with $rc"
+		return 1
+	fi
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 4 \
+	    "the accepted recirc set was not applied" || return 1
+
+	info "the rejected set keeps the recirc bit"
+	einval=$(ovs_errno EINVAL) || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	rc=$?
+	[ "$rc" -eq "$einval" ] || {
+		ovs_fail "the rejected set failed with $rc"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 4 \
+	    "the rejected set dropped the recirc bit" || return 1
+
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" python3 "$ovs_base"/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
+		ovs_fail "the outdated add request did not run"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the outdated new request did not drop the features" || return 1
+
+	return 0
+}
+
 test_upcall_interfaces() {
 	sbx_add "test_upcall_interfaces" || return 1
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..a65fd4e194e7 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -2301,6 +2301,25 @@ class OvsDatapath(GenericNetlinkSocket):
 
         return reply
 
+    def set(self, dpname, ifindex=0, features=None, per_cpu_pids=None):
+        """ Send OVS_DP_CMD_SET for a datapath. """
+        msg = OvsDatapath.dp_cmd_msg()
+        msg["cmd"] = OVS_DP_CMD_SET
+        msg["version"] = OVS_DATAPATH_VERSION
+        msg["reserved"] = 0
+        msg["dpifindex"] = ifindex
+        msg["attrs"].append(["OVS_DP_ATTR_NAME", dpname])
+        if features is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", features])
+        if per_cpu_pids is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_PER_CPU_PIDS", per_cpu_pids])
+
+        reply = self.nlm_request(
+            msg, msg_type=self.prid, msg_flags=NLM_F_REQUEST | NLM_F_ACK
+        )
+
+        return reply[0]
+
     def create(
         self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
     ):
@@ -2961,6 +2980,26 @@ def main(argv):
     deldpcmd = subparsers.add_parser("del-dp")
     deldpcmd.add_argument("deldp", help="Datapath Name")
 
+    setdpcmd = subparsers.add_parser("set-dp")
+    setdpcmd.add_argument("setdp", help="Datapath Name")
+    setdpcmd.add_argument(
+        "-f",
+        "--features",
+        type=lambda x: int(x, 0),
+        default=None,
+        help="Datapath user features, defaults to the current value",
+    )
+    setdpcmd.add_argument(
+        "-p",
+        "--per-cpu-pids",
+        type=str,
+        default=None,
+        help=(
+            "Comma separated upcall pids; an empty string sends an empty "
+            "attribute"
+        ),
+    )
+
     addifcmd = subparsers.add_parser("add-if")
     addifcmd.add_argument("dpname", help="Datapath Name")
     addifcmd.add_argument("addif", help="Interface name for adding")
@@ -3057,6 +3096,41 @@ def main(argv):
             ovspk.upcall_handler(ovsflow)
     elif hasattr(args, "deldp"):
         ovsdp.destroy(args.deldp)
+    elif hasattr(args, "setdp"):
+        rep = ovsdp.info(args.setdp, 0)
+        if rep is None:
+            print(f"DP '{args.setdp}' not found.")
+            return 1
+        pids = None
+        if args.per_cpu_pids is not None:
+            # Empty entries are typos in a list the user did write, so drop
+            # them. An empty string leaves pids as [] and not None, which
+            # set() sends as an attribute with no payload. The kernel reads
+            # that attribute only when the same request also sets
+            # OVS_DP_F_DISPATCH_UPCALL_PER_CPU, and ovs_dp_set_upcall_portids()
+            # rejects it with EINVAL when its length is zero or not a multiple
+            # of four; the selftest sends the empty one and expects that.
+            try:
+                pids = [int(x) for x in args.per_cpu_pids.split(",")
+                        if x != ""]
+            except ValueError:
+                print(f"invalid per-cpu-pids: {args.per_cpu_pids}")
+                return 1
+        features = args.features
+        if features is None:
+            features = rep.get_attr("OVS_DP_ATTR_USER_FEATURES")
+            if features is None:
+                print(f"DP '{args.setdp}' does not report its features")
+                return 1
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], features, pids)
+        except NetlinkError as ne:
+            # args is (code, message) for the errors pyroute2 raises; anything
+            # else is still worth printing rather than raising IndexError here.
+            msg = ne.args[1] if len(ne.args) > 1 else str(ne)
+            print(f"set failed: {msg}")
+            return ne.code if ne.code > 0 else 1
+        print(f"DP '{args.setdp}' updated")
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.1

