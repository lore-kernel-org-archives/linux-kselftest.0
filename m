Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.36.163.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339985;
	b=JeGXt9ew4YiYeA5nmGxqcA4Fc88Fh9wreTivtvBtCRBHKTCUXElpMy77gocOpU5vsj++
	 EFMgciaCSXVnDEmjh05IigqSyGLq9FA+isfeiEpSyWAHaILL0M1lpJUI9myt9xFyVUp3T
	 AlMsy+Q9PMJevob8B5h19B034vAM9OotzWLH60ZoEPDAU3WqOytXG7/pR/45Kdkh4otKi
	 KAzDAFZN8hJpdpLixp+hYI0XYeEvkHQtLAoyJ65nC2tkP6jfCgRxj4jARwNsVyzn8jP4T
	 ATXpTmj4997VOfQ0zJXLjYXlMOakWeEzceaiaxe68u08RRibaLLX8giR7F5hDOd1HAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score:x-atlnz-ls;
	bh=Wm/iilB5CgT7+iUai4Q2JgTujeFHrVbrWuLvh18fVpo=;
	b=x8+Yap6RzRr3Y+Rw2+X7s1ngJNDMCWwzh8DGT618e1I87OF0S+m3Hsxeuz/+2zZbzIG8
	 oQ29vbPIobiHMlQdmLbsMhuFpybaTeoqYnp3YO6P6MlNL4NGGUZH4DxzclvOUii8jGKrO
	 wuedW2mvxsWKgqJJrBzPIy6htXOPXnV6Gx5F5JkBTmOzk9AtWS4zjScfAQmCow583pOKR
	 bM4C4nplX/fBWznFHkS0r+t57R0ys0KmxfVGKd2qwGJSyOwYbcl9+zk3EHaRBlYPlcv8b
	 acZBg+qby9TP9Y7YhtzwMPQEdrD+WFJc+PzTZUMkgzTceacc62SgfjLxxzUpRqktgcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alliedtelesis.co.nz;
	spf=pass smtp.mailfrom=alliedtelesis.co.nz;
	dkim=pass header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=CrIHP+Ni;
	arc=none smtp.remote-ip=202.36.163.20
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22540606A327
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 05:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22540606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=CrIHP+Ni
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B6FCA2C0677;
	Fri, 30 Oct 2026 18:59:42 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1793339982;
	bh=Wm/iilB5CgT7+iUai4Q2JgTujeFHrVbrWuLvh18fVpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CrIHP+NiwoE3I3YvGcNeolh5ie4qLS+HTgmvjsQMh5srrwGERRvGAOA9Ex4cVg1+Y
	 biTA1SSSmbJCiNu8n/f6XDoxMbSNzc6YvQA6VBDePcghfQnP5uFqw8WhO/M98SruE7
	 Jv1HKYGFKWPgOJ1avNOtZ0JT91C3YzGBDVYez90xlcF4qpsfJy58Ekig/ZYErVGpaW
	 y4vd6SXt9a0WR9e2AhRW9woViM2y94CFh6TEWNaLADM1nq/Dbimjve84a2Jekmy3lV
	 mMl8JcrVhNsYEY9QfRx9pP03la7mdeWp1NXgn0VaYXJ7G8P2WC27j3KjCvsTkWPJdh
	 8V6l9ALpLq6fw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6ae4324e0000>; Fri, 30 Oct 2026 18:59:42 +1300
Received: from angga-dl.ws.atlnz.lc (angga-dl.ws.atlnz.lc [10.33.22.14])
	by pat.atlnz.lc (Postfix) with ESMTP id 8173213EE2B;
	Fri, 30 Oct 2026 18:59:42 +1300 (NZDT)
Received: by angga-dl.ws.atlnz.lc (Postfix, from userid 1025)
	id 7F907564D90; Fri, 30 Oct 2026 18:59:42 +1300 (NZDT)
From: Hermin Anggawijaya <hermin.anggawijaya@alliedtelesis.co.nz>
To: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hermin Anggawijaya <hermin.anggawijaya@alliedtelesis.co.nz>
Subject: [PATCH net-next 2/2] selftests: net: test RA PIO handling of manually added addresses
Date: Fri, 30 Oct 2026 18:57:57 +1300
Message-ID: <20261030055757.2094944-3-hermin.anggawijaya@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030055757.2094944-1-hermin.anggawijaya@alliedtelesis.co.nz>
References: <20261030055757.2094944-1-hermin.anggawijaya@alliedtelesis.co.nz>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=FJW4xPos c=1 sm=1 tr=0 ts=6ae4324e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=660iZSQnnn4A:10 a=Q208khUp9j-A8GAraSAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a test that sends a Router Advertisement with three autonomous
PIOs to a host that has two manually added addresses matching the
addresses SLAAC would form from the first two prefixes:

 - a plain manual address must keep its infinite lifetimes,
 - a manual address added with mngtmpaddr must have its lifetimes
   refreshed from the PIO,
 - the third prefix must create a SLAAC address with the advertised
   lifetimes.

Extend _send_ra() so it can emit PIOs with the autonomous flag set.

Signed-off-by: Hermin Anggawijaya <hermin.anggawijaya@alliedtelesis.co.nz=
>
---
 tools/testing/selftests/net/rtnetlink.py | 79 +++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/rtnetlink.py b/tools/testing/sel=
ftests/net/rtnetlink.py
index 5534ade056a5..a1294460e9b5 100755
--- a/tools/testing/selftests/net/rtnetlink.py
+++ b/tools/testing/selftests/net/rtnetlink.py
@@ -266,7 +266,7 @@ def ipv6_route_del_reason_expired() -> None:
             ksft_eq(attrs.get('del-reason'), 'expired')
=20
=20
-def _send_ra(sock, ifindex, lifetime, rio=3DNone, pio=3DNone):
+def _send_ra(sock, ifindex, lifetime, rio=3DNone, pio=3DNone, slaac_pios=
=3D()):
     """The kernel fills in the ICMPv6 checksum on raw ICMPv6 sockets."""
=20
     # type, code, cksum, hop limit, flags, router lifetime,
@@ -282,6 +282,11 @@ def _send_ra(sock, ifindex, lifetime, rio=3DNone, pi=
o=3DNone):
         # RFC 4861 prefix information option, on-link only (L set, A cle=
ar)
         ra +=3D struct.pack('!BBBBIII', 3, 4, plen, 0x80, valid_lft, 0, =
0)
         ra +=3D socket.inet_pton(socket.AF_INET6, prefix)
+    for prefix, plen, valid_lft in slaac_pios:
+        # RFC 4861 prefix information option, on-link and autonomous
+        ra +=3D struct.pack('!BBBBIII', 3, 4, plen, 0xc0, valid_lft,
+                          valid_lft, 0)
+        ra +=3D socket.inet_pton(socket.AF_INET6, prefix)
     sock.sendto(ra, ('ff02::1', 0, 0, ifindex))
=20
=20
@@ -382,6 +387,77 @@ def ipv6_route_del_reason_absent() -> None:
                         "user deletion must not carry del-reason")
=20
=20
+def _ipv6_addr_lifetimes(ns, ifname):
+    """Map each global IPv6 address on ifname to (valid, preferred)."""
+
+    addrs =3D ip(f"-6 addr show dev {ifname} scope global", json=3DTrue,=
 ns=3Dns)
+    return {a['local']: (a['valid_life_time'], a['preferred_life_time'])
+            for a in addrs[0]['addr_info'] if 'local' in a}
+
+
+def ipv6_ra_pio_manual_addr_lifetime() -> None:
+    """
+    A PIO must refresh the lifetimes of SLAAC addresses only (RFC 4862
+    Section 5.5.3 e). A manually added address that matches the address
+    SLAAC would form keeps its lifetimes, unless it was added with
+    mngtmpaddr.
+    """
+
+    forever =3D 0xffffffff
+    lft =3D 600
+    # EUI-64 interface identifier of 02:00:00:00:00:01
+    iid =3D '::ff:fe00:1'
+    manual =3D '2001:db8:7' + iid
+    mngtmp =3D '2001:db8:8' + iid
+    slaac =3D '2001:db8:9' + iid
+
+    with NetNS() as ns_h, NetNS() as ns_r:
+        ip(f"link add veth0 netns {ns_h} type veth peer name veth1 netns=
 {ns_r}")
+        with NetNSEnter(str(ns_h)):
+            _write_ipv6_sysctl("conf/veth0/accept_ra", 2)
+            _write_ipv6_sysctl("conf/veth0/accept_dad", 0)
+            _write_ipv6_sysctl("conf/veth0/addr_gen_mode", 0)
+        with NetNSEnter(str(ns_r)):
+            _write_ipv6_sysctl("conf/veth1/accept_dad", 0)
+        ip("link set dev veth0 address 02:00:00:00:00:01", ns=3Dstr(ns_h=
))
+        ip(f"-6 addr add {manual}/64 dev veth0 nodad", ns=3Dstr(ns_h))
+        ip(f"-6 addr add {mngtmp}/64 dev veth0 nodad mngtmpaddr",
+           ns=3Dstr(ns_h))
+        ip("link set dev veth0 up", ns=3Dstr(ns_h))
+        ip("link set dev veth1 up", ns=3Dstr(ns_r))
+
+        sock, ifindex =3D _ra_router_sock(ns_r, "veth1")
+        # The PIOs are processed in order, so once the SLAAC address
+        # shows up the other two prefixes have been handled as well.
+        pios =3D [('2001:db8:7::', 64, lft), ('2001:db8:8::', 64, lft),
+                ('2001:db8:9::', 64, lft)]
+
+        lfts =3D {}
+        for _ in range(20):
+            try:
+                _send_ra(sock, ifindex, 0, slaac_pios=3Dpios)
+            except OSError:
+                # router link-local address still tentative
+                pass
+            time.sleep(0.2)
+            lfts =3D _ipv6_addr_lifetimes(str(ns_h), "veth0")
+            if slaac in lfts:
+                break
+
+        ksft_in(slaac, lfts, "RA did not create the SLAAC address")
+        if slaac not in lfts:
+            return
+
+        ksft_eq(lfts[manual], (forever, forever),
+                "RA changed the lifetimes of a manually added address")
+        # valid_lft is not lowered below two hours (RFC 4862 5.5.3 e),
+        # so only the preferred lifetime follows the PIO
+        ksft_true(0 < lfts[mngtmp][1] <=3D lft,
+                  f"RA did not refresh mngtmpaddr lifetimes: {lfts[mngtm=
p]}")
+        ksft_true(0 < lfts[slaac][0] <=3D lft and 0 < lfts[slaac][1] <=3D=
 lft,
+                  f"unexpected SLAAC address lifetimes: {lfts[slaac]}")
+
+
 def _insert_and_get_addrs_ipv4(test_addrs: list[str], scopes: list[str])=
 -> list[str]:
     with NetNS() as ns, NetNSEnter(str(ns)):
         dev_name =3D "dummy_dev"
@@ -497,6 +573,7 @@ def main() -> None:
               ipv6_route_del_reason_expired,
               ipv6_route_del_reason_ra_withdrawn,
               ipv6_route_del_reason_absent,
+              ipv6_ra_pio_manual_addr_lifetime,
               ipv4_verify_same_scope_addr_order, ipv4_verify_inter_scope=
_addr_order,
               ipv6_verify_same_scope_addr_order, ipv6_verify_inter_scope=
_addr_order])
     ksft_exit()
--=20
2.56.0

