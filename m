From: f.fainelli@gmail.com (Florian Fainelli)
Date: Wed, 17 Jan 2018 14:51:04 -0800
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 00/12] selftests:
 forwarding: Add VRF-based tests
In-Reply-To: <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <df929bcd-f15e-1897-fc54-c9aba9b65667@gmail.com>
Message-ID: <c8c4a3ef-f21d-0e13-5d35-dfa212c439ab@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180117225104._u1vDUmOuZRGF37glIOYcOpQ_w0lR4z0P6PpYO8g2FM@z>

On 01/15/2018 12:14 PM, David Ahern wrote:
> On 1/15/18 12:18 PM, Ido Schimmel wrote:
>> One of the nice things about network namespaces is that they allow one
>> to easily create and test complex environments.
>>
>> Unfortunately, these namespaces can not be used with actual switching
>> ASICs, as their ports can not be migrated to other network namespaces
>> (NETIF_F_NETNS_LOCAL) and most of them probably do not support the
>> L1-separation provided by namespaces.
>>
>> However, a similar kind of flexibility can be achieved by using VRFs and
>> by looping the switch ports together. For example:
>>
>>                              br0
>>                               +
>>                vrf-h1         |           vrf-h2
>>                  +        +---+----+        +
>>                  |        |        |        |
>>     192.0.2.1/24 +        +        +        + 192.0.2.2/24
>>                swp1     swp2     swp3     swp4
>>                  +        +        +        +
>>                  |        |        |        |
>>                  +--------+        +--------+
>>
>> The VRFs act as lightweight namespaces representing hosts connected to
>> the switch.
>>
>> This approach for testing switch ASICs has several advantages over the
>> traditional method that requires multiple physical machines, to name a
>> few:
>>
>> 1. Only the device under test (DUT) is being tested without noise from
>> other system.
>>
>> 2. Ability to easily provision complex topologies. Testing bridging
>> between 4-ports LAGs or 8-way ECMP requires many physical links that are
>> not always available. With the VRF-based approach one merely needs to
>> loopback more ports.
>>
>> These tests are written with switch ASICs in mind, but they can be run
>> on any Linux box using veth pairs to emulate physical loopbacks.
>>
>> Feedback is is welcome. Particularly regarding the best location for
>> these tests (e.g., current location, tools/testing/selftests/net).
>>
> 
> Awesome. Thanks for working on this.

Agreed this is really cool! For DSA enabled switches, we usually have a
host that does the test sequencing and then execute commands remotely on
the DUT, but we might be able to get such a similar framework up and
running on the DUT itself without too much hassle.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
