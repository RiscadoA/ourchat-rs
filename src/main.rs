use igd::{search_gateway, PortMappingProtocol};
use local_ip_address::local_ip;
use std::net::{IpAddr, SocketAddrV4};

/// Port used by OurChat
const PORT: u16 = 9435;

fn main() {
    // Open port with igd
    let gateway = search_gateway(Default::default()).unwrap();
    let local_ip = match local_ip().unwrap() {
        IpAddr::V4(ip) => ip,
        _ => panic!("No local IP address found"),
    };
    gateway
        .add_port(
            PortMappingProtocol::TCP,
            PORT,
            SocketAddrV4::new(local_ip, PORT),
            0,
            "OurChat Port",
        )
        .unwrap();
}
