<!--#include file ="lib/Conexao.asp"--> 
<!DOCTYPE html>
<html lang="en"> 
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Maxim - v4.7.0
  * Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
      
      <img src="assets/img/novo.png"/>

        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="#about">Quem Somos?</a></li>
          <li><a class="nav-link scrollto" href="#services">Serviços</a></li>
          <li><a class="nav-link scrollto " href="#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="#testimonials">Depoimentos</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contato</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center align-items-center">
    <div class="container text-center text-md-left" data-aos="fade-up">
      <h1>Bem-Vindo a D'Lauras Móveis Planejados</h1>
      <h2>Realizando Sonhos de Milhares de pessoas</h2>
      <a href="#about" class="btn-get-started scrollto">Vamos!</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container">

        <div class="row">
          <div class="col-xl-6 col-lg-9" data-aos="fade-right">
            <img src="assets/img/about-img.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-xl-6 col-lg-5 pt-5 pt-lg-0">
            <h3 data-aos="fade-up">Quem Somos?</h3>
            <p data-aos="fade-up">
              A D'Lauras Móveis Planejados atua desde 1995 no mercado, com a missão de proporcionar ambientes personalizados sob medida, com produtos e serviços de qualidade, apresentando soluções para seu espaço. Tudo isso feito com muita segurança, honestidade, comprometimento e qualidade. 
            </p>
            <p data-aos="fade-up">
              Desenvolvemos seu projeto de acordo com seus ambientes, de forma a oferecer o melhor aproveitamento possível, bem como de propiciar uma excelente experiência estética, com a criação de ambientes únicos e especiais. 
            </p>
            <p data-aos="fade-up">
              Com base em seus valores, a atuação da empresa tem como prioridades a excelência e a exclusividade que somente um móvel sob medida oferece, respeitando os prazos estabelecidos e visando ao máximo satisfazer todas as necessidades e anseios dos clientes. 
            </p>
            <p data-aos="fade-up">
              Sua sede, localizada na 903 Sul, Alameda 19, QD 14, onde é realizada toda a produção dos móveis D'Lauras, também conta com um ambiente para receber confortavelmente seus clientes. 
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->

    <section id="services" class="services section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Serviços</h2>
          <p align="justify">Produzimos móveis personalizados para variados tipos de desejos e necessidades, desde armários para banheiro e cozinha, criados, painéis para TV e home-theather, bancadas de estudo, closets, camas, até portas e balcões de atendimento.</p>
          <p align="left">Nossa fabricação personalizável potencializa o aproveitamento dos espaços de forma primorosa e elegante, porém sem abrir mão da praticidade.</p>
        </div>

        <div class="row">
<%
call abreConexao
sql = "select * from DL_CadServico inner join DL_Servico on DL_Servico.id_servico = DL_CadServico.Tipo_Servico order by id_CadServico"
set rs = conn.execute(sql)
do while not rs.eof
%>
            <div class="col-md-6 col-lg-3 col-xs-12" data-aos="fade-up">
            <div class="services-item wow fadeInDown" data-wow-delay="0.3s">
            <div class="icon-box icon-box-cyan">
              <div class="icon"><i class="bi bi-grid"></i></div>
              <div class="services-content">
              <h4 class="title"><a href=""><%=rs("Nome_Servico")%></a></h4>
              <p class="description"><%=rs("NomeServico")%></p>
              </div>
            </div>
          </div>
          </div>




<%
rs.movenext
loop
call fechaConexao
%>
        </div>

      </div>
    </section><!-- End Services Section -->


    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Portfolio</h2>
          <p>Todas as imagens abaixo fizeram parte da nossa linha de produção, ao qual os clientes acreditaram nas possibilidades e juntos traçamos de projetos simples aos mais complexos em detalhes, sempre mantendo nosso padrão de qualidade e principalmente de atendimento.</p>
        </div>

       

        <div class="row portfolio-container" data-aos="fade-up">
<%
call abreConexao
sql = "select * from DL_CadPortfolio"
set rs = conn.execute(sql)
do while not rs.eof
%>
          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="Upload/<%=rs("AnexoPortfolio")%>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4><%=rs("nome")%></h4>
                <p><%=rs("nome")%></p>
                <div class="portfolio-links">
                  <a href="Upload/<%=rs("AnexoPortfolio")%>" data-gallery="portfolioGallery" class="portfolio-lightbox" title="<%=rs("nome")%>"><i class="bx bx-plus"></i></a>
                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                </div>
              </div>
            </div>
          </div>
<%
rs.movenext
loop
call fechaConexao
%>
          

        </div>

      </div>
    </section><!-- End Portfolio Section -->

 <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Depoimentos</h2>
          <p>Nesses quase 27 anos de histórias além de clientes fizemos muitos amigos e parceiros, veja abaixo alguns depoimentos.
Quer deixar um depoimento também?<a href="https://www.google.com/search?q=D%27Lauras+M%C3%B3veis+Planejados+-+Plano+Diretor+Sul%2C+Palmas+-+TO&sxsrf=APq-WBtzi__rkk35voC2r53ARTsOdcJZWw%3A1644853557254&source=hp&ei=NXkKYuLZDMfS1sQP8-Gs6AU&iflsig=AHkkrS4AAAAAYgqHRSf5sXZNNvsfDWvj3NXUPgz_5gaY&oq=dlauras+mo&gs_lcp=Cgdnd3Mtd2l6EAMYADICCCY6CwguEIAEEMcBEK8BOg4ILhCABBCxAxDHARDRAzoICAAQgAQQsQM6CwgAEIAEELEDEIMBOggIABCxAxCDAToFCAAQgAQ6CwguEIAEEMcBEKMCOggILhCABBCxAzoLCC4QgAQQxwEQ0QM6CwguEIAEELEDEIMBOgcIABCxAxAKOgcILhCABBAKOgoIABCxAxCDARAKOgcIABCABBAKOgoIABCABBDJAxAKOg0ILhCABBDHARCvARAKOggILhCxAxCDAToHCC4QsQMQCjoECC4QCjoECAAQCjoGCAAQChAeOgoILhDHARCvARATOgYIABAKEBM6BAgAEBM6CAgAEA0QHhATOgoIABANEAoQHhATOgwIABANEAUQChAeEBM6BggAEA0QHjoICAAQDRAKEB5QAFjLEGCCG2gAcAB4AIABzgGIAZoMkgEFMC45LjGYAQCgAQE&sclient=gws-wiz#lrd=0x933b35e740954b21:0xc661c1dddd9a25bd,3,,,">Clique aqui!</a></p>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">
          <%
call abreConexao
sql = "select * from DL_Depoimento order by id_Depoimento"
set rs = conn.execute(sql)
do while not rs.eof
%>
            <div class="swiper-slide">

              <div class="testimonial-item">
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                   <%=rs("Depoimento")%>
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
                <h3><%=rs("NomeCompleto")%></h3>
              </div>
            </div><!-- End testimonial item -->
<%
rs.movenext
loop
call fechaConexao
%>


          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Contato</h2>
        </div>

        <div class="row no-gutters justify-content-center" data-aos="fade-up">

          <div class="col-lg-5 d-flex align-items-stretch">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Localização:</h4>
                <p>QUADRA 903 Sul, Alameda 19, QD 14, Palmas - TO, 77017-278</p>
              </div>

              <div class="email mt-4">
                <i class="bi bi-envelope"></i>
                <h4>Email:</h4>
                <p>dlaurasmoveis@gmail.com</p>
              </div>

              <div class="phone mt-4">
                <i class="bi bi-phone"></i>
                <h4>Telefone:</h4>
                <p>(63) 99211-7264</p>
              </div>

            </div>

          </div>

          <div class="col-lg-5 d-flex align-items-stretch">

            <iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1963.125776057772!2d-48.3386098!3d-10.2412846!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xc661c1dddd9a25bd!2sD&#39;Lauras%20M%C3%B3veis%20Planejados!5e0!3m2!1spt-BR!2sbr!4v1637941550446!5m2!1spt-BR!2sbr"></iframe>
            

          </div>

        </div>


        <div class="row mt-5 justify-content-center" data-aos="fade-up">
          <div class="col-lg-10">
            <form action="envia_mensagem.asp" method="post" role="form" class="form-group">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="nome" class="form-control" id="name" placeholder="Seu Nome" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="email" class="form-control" name="email" id="email" placeholder="joao@gmail.com" required>
                </div>
              </div>
 				<div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="assunto" class="form-control" id="assunto" placeholder="Descrição" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="Telefone" class="form-control" name="Telefone" id="Telefone" placeholder="(00)00000-0000" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="mensagem" rows="5" placeholder="Mensagem" required></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Menssagem enviada com Sucesso!</div>
              </div>
              <div class="text-center"><button type="submit">Enviar</button></div>
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <p>
                D'LAURAS<br>
                MÓVEIS PLANEJADOS<br><br>
                <strong>Telefone:</strong> +55 (63) 99211-7264<br>
                <strong>Email:</strong> dlaurasmoveis@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#hero">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#about">Quem Somos?</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#services">Serviços</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#portfolio">Portfolio</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#testimonials">Depoimentos</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#contact">Contato</a></li>
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>D'LAURAS MOVEIS</span></strong>. Todos os direitos
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/ -->
        MORAIS & SILVA LTDA.
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>